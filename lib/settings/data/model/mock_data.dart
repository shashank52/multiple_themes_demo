import 'package:multiple_themes_demo/settings/data/model/app_color_model.dart';

const COLOR_LIST = {
  "data": [
    {
      "color_name": "Red",
      "color_code": {"type": "hex", "value": "#DB374A"}
    },
    {
      "color_name": "Indigo",
      "color_code": {"type": "hex", "value": "#5556D9"}
    },
    {
      "color_name": "Purple",
      "color_code": {"type": "hex", "value": "#6200EE"}
    },
    {
      "color_name": "Blue",
      "color_code": {"type": "hex", "value": "#1366D9"}
    },
    {
      "color_name": "Light Blue",
      "color_code": {"type": "hex", "value": "#0A96D7"}
    },
    {
      "color_name": "Violet",
      "color_code": {"type": "hex", "value": "#9640D9"}
    },
    {
      "color_name": "Pink",
      "color_code": {"type": "hex", "value": "#D940AB"}
    },
    {
      "color_name": "Rose Pink",
      "color_code": {"type": "hex", "value": "#E0385F"}
    },
    {
      "color_name": "Orange",
      "color_code": {"type": "hex", "value": "#E45C12"}
    },
    {
      "color_name": "Light Orange",
      "color_code": {"type": "hex", "value": "#F79009"}
    },
    {
      "color_name": "Yellow",
      "color_code": {"type": "hex", "value": "#F7B409"}
    },
    {
      "color_name": "Light Yellow",
      "color_code": {"type": "hex", "value": "#EFCB15"}
    },
    {
      "color_name": "Light Green",
      "color_code": {"type": "hex", "value": "#ADD83A"}
    },
    {
      "color_name": "Green",
      "color_code": {"type": "hex", "value": "#78BB24"}
    },
    {
      "color_name": "Dark Green",
      "color_code": {"type": "hex", "value": "#1B8820"}
    },
    {
      "color_name": "Peacock Green",
      "color_code": {"type": "hex", "value": "#3D9A89"}
    },
  ]
};

AppColorModel appColorModel = AppColorModel.fromMap(COLOR_LIST);
