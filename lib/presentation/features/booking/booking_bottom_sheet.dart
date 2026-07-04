import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../domain/models/slot.dart';
import 'booking_cubit.dart';
import 'booking_state.dart';
import 'widgets/booking_form_view.dart';
import 'widgets/booking_success_view.dart';

class BookingBottomSheet extends StatefulWidget {
  final Slot slot;
  final String doctorName;

  const BookingBottomSheet({
    super.key,
    required this.slot,
    required this.doctorName,
  });

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _complaintsController = TextEditingController();
  final _diseasesController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String? _attachedFilePath;
  String? _attachedFileName;
  late final BookingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<BookingCubit>();
  }

  @override
  void dispose() {
    unawaited(_cubit.close());
    _complaintsController.dispose();
    _diseasesController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _attachFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
    );

    if (!mounted) return;

    final file = result?.files.single;
    final path = file?.path;
    if (path == null || !File(path).existsSync()) {
      return;
    }

    setState(() {
      _attachedFilePath = path;
      _attachedFileName = file?.name ?? path.split('/').last;
    });
  }

  void _removeAttachedFile() {
    setState(() {
      _attachedFilePath = null;
      _attachedFileName = null;
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final height = double.tryParse(_heightController.text) ?? 0.0;
    final weight = double.tryParse(_weightController.text) ?? 0.0;

    await _cubit.book(
      scheduleSlotId: widget.slot.id,
      complaints: _complaintsController.text,
      chronicDiseases: _diseasesController.text,
      height: height,
      weight: weight,
      filePath: _attachedFilePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeText =
        '${widget.slot.startTime.hour.toString().padLeft(2, '0')}:${widget.slot.startTime.minute.toString().padLeft(2, '0')} - '
        '${widget.slot.endTime.hour.toString().padLeft(2, '0')}:${widget.slot.endTime.minute.toString().padLeft(2, '0')}';
    final dateText =
        '${widget.slot.startTime.day.toString().padLeft(2, '0')}.${widget.slot.startTime.month.toString().padLeft(2, '0')}.${widget.slot.startTime.year}';

    return BlocProvider(
      create: (context) => _cubit,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      if (!context.mounted) return;
                      Navigator.pop(context, true);
                    });
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  success: () => BookingSuccessView(
                    doctorName: widget.doctorName,
                  ),
                  orElse: () => BookingFormView(
                    formKey: _formKey,
                    complaintsController: _complaintsController,
                    diseasesController: _diseasesController,
                    heightController: _heightController,
                    weightController: _weightController,
                    dateText: dateText,
                    timeText: timeText,
                    attachedFileName: _attachedFileName,
                    state: state,
                    onClose: () => Navigator.pop(context),
                    onAttachFile: _attachFile,
                    onRemoveFile: _removeAttachedFile,
                    onSubmit: _onSubmit,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
