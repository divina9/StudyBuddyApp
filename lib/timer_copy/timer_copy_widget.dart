import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_copy_model.dart';
export 'timer_copy_model.dart';

class TimerCopyWidget extends StatefulWidget {
  const TimerCopyWidget({Key? key}) : super(key: key);

  @override
  _TimerCopyWidgetState createState() => _TimerCopyWidgetState();
}

class _TimerCopyWidgetState extends State<TimerCopyWidget> {
  late TimerCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerCopyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '[User]\'s Study Session has begun!',
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time Left',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 24.0),
                          child: FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(value,
                                    milliSecond: false),
                            timer: _model.timerController,
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 64.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 30.0,
                          borderWidth: 2.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.pause_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            _model.timerController.onExecute
                                .add(StopWatchExecute.stop);
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 30.0,
                          borderWidth: 2.0,
                          buttonSize: 60.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 36.0,
                          ),
                          onPressed: () async {
                            _model.timerController.onExecute
                                .add(StopWatchExecute.start);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Your timer has ended! Would you like to extend the session?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('Timer');
                },
                text: 'Yes',
                options: FFButtonOptions(
                  width: 97.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('success');
                },
                text: 'No',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
