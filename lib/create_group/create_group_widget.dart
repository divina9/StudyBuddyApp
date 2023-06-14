import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_group_model.dart';
export 'create_group_model.dart';

class CreateGroupWidget extends StatefulWidget {
  const CreateGroupWidget({Key? key}) : super(key: key);

  @override
  _CreateGroupWidgetState createState() => _CreateGroupWidgetState();
}

class _CreateGroupWidgetState extends State<CreateGroupWidget> {
  late CreateGroupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGroupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('dashboard');
            },
          ),
          title: Text(
            'Create Study Group',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.86, -0.86),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final chatMessagesUpdateData =
                          createChatMessagesRecordData();
                      await currentUserReference!
                          .update(chatMessagesUpdateData);
                    },
                    child: Text(
                      '[USER] Study Session',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.5, -0.32),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<String>(null),
                  options: [
                    'Agni 1',
                    'Agni 4',
                    'Agni 5',
                    'Design Lab',
                    'Library',
                    'Activity Room',
                    'Mess'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue1 = val),
                  width: 300.0,
                  height: 50.0,
                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: 'Location',
                  searchHintText: 'Search for an Location',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: true,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.11, 0.05),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (kIsWeb) {
                      final _datePickedDate = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                      );

                      TimeOfDay? _datePickedTime;
                      if (_datePickedDate != null) {
                        _datePickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                      }

                      if (_datePickedDate != null && _datePickedTime != null) {
                        setState(() {
                          _model.datePicked = DateTime(
                            _datePickedDate.year,
                            _datePickedDate.month,
                            _datePickedDate.day,
                            _datePickedTime!.hour,
                            _datePickedTime.minute,
                          );
                        });
                      }
                    } else {
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked = date;
                          });
                        },
                        currentTime: getCurrentTimestamp,
                        minTime: getCurrentTimestamp,
                        locale: LocaleType.values.firstWhere(
                          (l) =>
                              l.name ==
                              FFLocalizations.of(context).languageCode,
                          orElse: () => LocaleType.en,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/schedule.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.11, 0.25),
                child: Text(
                  'Select Date and time',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.05, 0.68),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Create Group',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.46, -0.7),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController2 ??=
                      FormFieldController<String>(null),
                  options: ['Online', 'Offline'],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue2 = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: 'Online/Offline',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.48, -0.51),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController3 ??=
                      FormFieldController<String>(null),
                  options: ['Public', 'Private'],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue3 = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: 'Public/ Private',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
