# fam_assignment

Develop an android app to display a list of Contextual Cards

## Getting Started

This project is a starting point for a Flutter application.


# FOLDER STRUCTURE (Uses clean architecture with provider)
Assets -> These folder includes all the static images that i have used in this project.


lib 
  - core
      - app_images.dart   // Initialization of images used
      - custom_spacers.dart  // it includes custom and responsive heights and widths taking figma phone screen size as parent size
      - screen_utils.dart    // It includes screen utils with dynamic sizes
      - url_constants.dart    //  This include all the urls for now we have only one.
      - value_constants.dart   // This file includes default sizes
        
  - features   // contains all the screens 
      - home   // first screen and only feature that is included in this feature
          - data  // It contains all the api call and data fetching that is to be used in homepage. 
              -  home_provider.dart   // This is the provider file which is fetching api and handling the states of the home screen.
          - models // Contains different models for different containers , that are being set during api call
              - hc1_model.dart
              - hc3_model.dart
              - hc5_model.dart
              - hc6_model.dart
              - hc9_model.dart
           
         - screens   // This folder all the screens related to this feature .For now we have only one screen
             - home_screen.dart

         - widgets // This folder will contain all the related widgets and their logics
             - cta_button.dart  //action button for hc3 container
             - hc1_widget.dart
             - hc3_widget.dart
             - hc5_widget.dart
             - hc6_widget.dart
             - hc9_widget.dart
          
  - main.dart //Initialization of the project. 
