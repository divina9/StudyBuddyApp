import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_withrestart_model.dart';
export 'timer_withrestart_model.dart';

class TimerWithrestartWidget extends StatefulWidget {
  const TimerWithrestartWidget({Key? key}) : super(key: key);

  @override
  _TimerWithrestartWidgetState createState() => _TimerWithrestartWidgetState();
}

class _TimerWithrestartWidgetState extends State<TimerWithrestartWidget> {
  late TimerWithrestartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerWithrestartModel());

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close_rounded,
              color: Color(0xFF14181B),
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            '[User]\'s study session',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF14181B),
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF14181B),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Color(0xFFE0E3E7),
                          borderRadius: 30.0,
                          borderWidth: 2.0,
                          buttonSize: 44.0,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: Color(0xFF14181B),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            _model.timerController.onExecute
                                .add(StopWatchExecute.reset);
                          },
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
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                          ),
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
                                color: Color(0xFF14181B),
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
                        borderColor: Color(0xFFE0E3E7),
                        borderRadius: 30.0,
                        borderWidth: 2.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.pause_rounded,
                          color: Color(0xFF14181B),
                          size: 30.0,
                        ),
                        onPressed: () async {
                          _model.timerController.onExecute
                              .add(StopWatchExecute.stop);
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Color(0xFF4B39EF),
                        borderRadius: 30.0,
                        borderWidth: 2.0,
                        buttonSize: 60.0,
                        fillColor: Color(0x4C4B39EF),
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: Color(0xFF4B39EF),
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
              'Only the group admin has access to the timer, however you can leave the session at any time you want.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('success');
                },
                text: 'Leave Session',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
