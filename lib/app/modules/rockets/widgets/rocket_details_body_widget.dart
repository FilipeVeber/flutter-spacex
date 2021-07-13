import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/base_widgets/base_image_from_network_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RocketDetailsBodyWidget extends StatelessWidget {
  final Rocket _rocket;

  RocketDetailsBodyWidget(this._rocket);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildImagesCarousel(),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildInfo("company", _rocket.company,
                  icon: Icon(Icons.apartment)),
              _buildInfo("country", _rocket.country, icon: Icon(Icons.flag)),
              _buildInfo("first flight", _rocket.firstFlight),
              _buildInfo("status", _rocket.isActive ? "Active" : "Inactive",
                  icon: Icon(Icons.airplanemode_on)),
              _buildInfo("cost per launch",
                  "US\$ ${_rocket.costPerLaunch.toStringAsFixed(2)}",
                  icon: Icon(Icons.attach_money)),
              _buildSuccessRateBar(),
              _buildInfo("description", _rocket.description),
              _buildLinks([_rocket.wikipedia]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagesCarousel() {
    if (_rocket.images != null && _rocket.images.length > 0) {
      return Container(
        height: 200,
        child: Carousel(
          images:
              _rocket.images.map((i) => BaseImageFromNetworkWidget(i)).toList(),
          boxFit: BoxFit.fill,
          dotSize: 5,
          dotBgColor: Colors.transparent,
          dotColor: Colors.white54,
          dotIncreasedColor: Colors.white,
          autoplay: false,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildInfo(String label, String content, {Icon icon}) {
    return Card(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                icon != null ? icon : Container(),
                SizedBox(
                  width: 5,
                ),
                _buildLabel(label),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(content),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2));
  }

  Widget _buildSuccessRateBar() {
    return Card(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Icon(Icons.bar_chart),
                SizedBox(
                  width: 5,
                ),
                _buildLabel("Success Rate Percentual"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            LinearPercentIndicator(
              leading: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "0%",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "100%",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              center: Text(
                "${_rocket.successRatePercentual}%",
                style: TextStyle(
                    fontSize: 12,
                    color: _rocket.successRatePercentual < 50
                        ? Colors.black38
                        : Colors.white),
              ),
              progressColor: Colors.blue,
              percent: _rocket.successRatePercentual.toDouble() / 100,
              lineHeight: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLinks(List<String> links) {
    if (links != null && links.length > 0) {
      return Card(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.open_in_new),
                  SizedBox(
                    width: 5,
                  ),
                  _buildLabel("links"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ListView(
                shrinkWrap: true,
                children: links.map((l) => Text(l)).toList(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
