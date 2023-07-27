// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/models/activity.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState(user: user);
}

class _ProfilePageState extends State<ProfilePage> {
  final User user;
  _ProfilePageState({required this.user});

  bool isLoading = false;
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    List<Activity>? activities = MyApp.of(context).userData.activities;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
            onSelected: (value) {
              if (value == 'photo') {
                _showChangeProfilePhotoModal(context);
              }
              if (value == 'logout') {
                var authService = MyApp.of(context).authService;
                authService.authenticated = false;
                authService.email = '';
                authService.token_auth == '';

                AutoRouter.of(context).replace(SignInRoute());
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'photo',
                  child: Text('Editar Foto'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Cerrar Sesión'),
                ),
              ];
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(user?.profilePhotoUrl ??
                              'https://pimedelaar.org/wp-content/uploads/2023/05/no-image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${user?.firstName} ${user?.lastName1}" ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Categoría: ${user!.category}',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            'Eventos',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF525E7B),
                              height: 1.4,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            user?.points.toString() ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            'Puntos',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF525E7B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text(
                            'Mis Puntos',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              AutoRouter.of(context).push(RankingRoute());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(const Color
                                      .fromRGBO(49, 220, 118,
                                  1.0)), // Cambiar el color del botón a verde
                            ),
                            child: Text(
                              'Ver Ranking',
                              style: TextStyle(
                                color: Colors
                                    .white, // Cambiar el color del texto a blanco (opcional)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          height: 200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 500,
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 150,
                                    endAngle: 30,
                                    radiusFactor: 0.8,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 20,
                                      color: const Color.fromARGB(
                                          255, 147, 229, 150),
                                      thicknessUnit: GaugeSizeUnit.logicalPixel,
                                    ),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: user!.points?.toDouble() ?? 0.0,
                                        width: 20,
                                        color: Colors.green,
                                        pointerOffset: 10,
                                        enableAnimation: true,
                                        animationDuration: 1000,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned.fill(
                                child: FractionallySizedBox(
                                  alignment: Alignment.center,
                                  widthFactor: 0.4,
                                  heightFactor: 0.4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Progreso',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '${user!.points}/ ${user!.targetPoints}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Actividad Reciente',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (activities?.length == 0) ...[
                    Text("No hay actividades registradas")
                  ],
                  const SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: activities!.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      itemBuilder: (context, index) {
                        Activity activity = activities[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(activity.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text(
                                        activity.name!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "+" +
                                            activity.points!.toString() +
                                            " pts",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 3),
                                    Text(
                                      _formatDate(activity.date!) ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  String? _formatDate(String? date) {
    if (date != null) {
      final dateTime = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
    return null;
  }

  void _showChangeProfilePhotoModal(BuildContext context) async {
    final picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              )
            : Container(
                padding: EdgeInsets.all(16),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Cambiar Foto de Perfil',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Tomar foto'),
                      onTap: () async {
                        final pickedFile = await picker.pickImage(
                          source: ImageSource.camera,
                        );

                        if (pickedFile != null) {
                          sendPhoto(context, pickedFile);
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Seleccionar de la galería'),
                      onTap: () async {
                        final pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (pickedFile != null) {
                          sendPhoto(context, pickedFile);
                        }
                      },
                    ),
                  ],
                ),
              );
      },
    );
  }

  Future<void> sendPhoto(context, photo) async {
    final newContext = context;

    if (isLoading != true) {
      Navigator.pop(context, null);
      setState(() {
        isLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Guardando foto...'),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );

      try {
        Response response = await userService.addPhoto(newContext, photo);
        dynamic res = response.data;

        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        if (res['error'] == null && res["message"] != "") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registro exitoso!'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ),
          );
          user.profilePhotoUrl = res['profile_photo_url'];
          setState(() {
            isLoading = false;
          });
          AutoRouter.of(context).push(HomeRoute(user: user));
        } else {
          setState(() {
            isLoading = false;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return FailedModal(
                title: 'Ha ocurrido un error',
                description:
                    "Por favor verifique su conexión a internet y vuelva a iniciar sesión. ",
              );
            },
          );
        }
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedModal(
              title: 'Ha ocurrido un error',
              description:
                  "Por favor verifique su conexión a internet y vuelva a iniciar sesión. ",
            );
          },
        );
      }
    }
  }
}
