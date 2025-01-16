import '/backend/api_requests/api_calls.dart';
import '/components/search_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'control_a_p_i_model.dart';
export 'control_a_p_i_model.dart';

class ControlAPIWidget extends StatefulWidget {
  const ControlAPIWidget({super.key});

  @override
  State<ControlAPIWidget> createState() => _ControlAPIWidgetState();
}

class _ControlAPIWidgetState extends State<ControlAPIWidget>
    with TickerProviderStateMixin {
  late ControlAPIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlAPIModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                safeSetState(() {});
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 34.0,
              ),
            ),
            title: Text(
              'Control',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().Cpunt = FFAppState().Cpunt;
                        safeSetState(() {});
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const SearchWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Icon(
                        Icons.manage_search,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 34.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 0.0),
                    child: Text(
                      '0 /${FFAppState().TotalTiendas}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ],
              ),
            ],
            centerTitle: false,
            toolbarHeight: 80.0,
            elevation: 0.0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: GetTiendaCall.call(
                    tiendanum: FFAppState().numeroTienda.toString(),
                    deptonum: FFAppState().Cpunt,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 250.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitFadingCube(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewGetTiendaResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final itemsList = getJsonField(
                          listViewGetTiendaResponse.jsonBody,
                          r'''$''',
                        ).toList().take(100).toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: itemsList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, itemsListIndex) {
                            final itemsListItem = itemsList[itemsListIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x411D2429),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 4.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  itemsListItem,
                                                  r'''$.Descrip''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      'SKU:',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        itemsListItem,
                                                        r'''$.SKU''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 70,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      'Depto:',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        itemsListItem,
                                                        r'''$.Depto''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 70,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      'Stock:',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                8.0, 0.0),
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        itemsListItem,
                                                        r'''$.Stock''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 70,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 15.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var shouldSetState = false;
                                                if (FFAppState().Green ==
                                                    getJsonField(
                                                      itemsListItem,
                                                      r'''$.color''',
                                                    )) {
                                                  _model.apiResultbUpdate =
                                                      await UpdatecolorCall
                                                          .call(
                                                    tiendaUpdate: FFAppState()
                                                        .numeroTienda
                                                        .toString(),
                                                    skuUpdate: getJsonField(
                                                      itemsListItem,
                                                      r'''$.SKU''',
                                                    ).toString(),
                                                    colorUpdate: 3,
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.apiResultbUpdate
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (shouldSetState) {
                                                      safeSetState(() {});
                                                    }
                                                    return;
                                                  }
                                                } else {
                                                  _model.apiResultbUpdate2 =
                                                      await UpdatecolorCall
                                                          .call(
                                                    tiendaUpdate: FFAppState()
                                                        .numeroTienda
                                                        .toString(),
                                                    skuUpdate: getJsonField(
                                                      itemsListItem,
                                                      r'''$.SKU''',
                                                    ).toString(),
                                                    colorUpdate: 1,
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.apiResultbUpdate2
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (shouldSetState) {
                                                      safeSetState(() {});
                                                    }
                                                    return;
                                                  }
                                                }

                                                if (shouldSetState) {
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: '',
                                              options: FFButtonOptions(
                                                width: 40.0,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: FFAppState().Green ==
                                                        getJsonField(
                                                          itemsListItem,
                                                          r'''$.color''',
                                                        )
                                                    ? const Color(0xFF1EFF00)
                                                    : Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              if (FFAppState().Red ==
                                                  getJsonField(
                                                    itemsListItem,
                                                    r'''$.color''',
                                                  )) {
                                                _model.apiResultjvk =
                                                    await UpdatecolorCall.call(
                                                  tiendaUpdate: FFAppState()
                                                      .numeroTienda
                                                      .toString(),
                                                  skuUpdate: getJsonField(
                                                    itemsListItem,
                                                    r'''$.SKU''',
                                                  ).toString(),
                                                  colorUpdate: 3,
                                                );

                                                shouldSetState = true;
                                                if ((_model.apiResultjvk
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                }
                                              } else {
                                                _model.apiResultjvk2 =
                                                    await UpdatecolorCall.call(
                                                  tiendaUpdate: FFAppState()
                                                      .numeroTienda
                                                      .toString(),
                                                  skuUpdate: getJsonField(
                                                    itemsListItem,
                                                    r'''$.SKU''',
                                                  ).toString(),
                                                  colorUpdate: 2,
                                                );

                                                shouldSetState = true;
                                                if ((_model.apiResultjvk2
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                }
                                              }

                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                            },
                                            text: '',
                                            options: FFButtonOptions(
                                              width: 40.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: FFAppState().Red ==
                                                      getJsonField(
                                                        itemsListItem,
                                                        r'''$.color''',
                                                      )
                                                  ? const Color(0xFFFF0000)
                                                  : Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
