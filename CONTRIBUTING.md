# Keysmith for Android Contributing Guide 📚
## This guide is under development and we request your feedback.

### Thank you for investing your time in contributing to the project.

## Issues 🤔

* ### Create a new issue

    If you spot an error while using the project, search if an issue already exists. If a related issue doesn't exists, you can open a new issue.

## Pull Request 🙏🏽

When you are finished with the changes, create a pull request.

- Mention the changes and also update the relevant docs readme file.
  
- Don't forget to link PR to issue if you are solving one.
- We may ask for changes to be made before a PR can be merged by using PR comments.

## How to add functionality 👩🏾‍💻
 - Choose the layer you want to contribute to. The layers are [```presentation```](#presentation-layer), [```domain```](#domain-layer) or [```data```](#data-layer).
  
 - Checkout the [Folder Structure](#folder-structure-🗄️) below to understand the naming conventions.
   * Follow this checklist 
     - [x] Request the abstraction for the layer, if it isn't present already.
    
     - [x] All the dependacies required by the object you want to create, must be injected from the constructor.
     - [x] Write documentation to describe what your code does in brief. If possible, add a snippet of code to let us know how to use your piece of code effectively.
     - [x] Write unit tests! The test must be placed in the directory structure mimicking the source code.
     
- #### If you are not familiar with writing tests, you can ask for the same when you request for the abstraction.

### Folder Structure 🗄️
We are aiming to follow a clean code architecture and this is how it looks!


```markdown
    📦 Keysmith
    ├── 📜 l10n.yaml
    ├── 📂 lib
    │   ├── 📜 main.dart
    │   └── 📂 src
    │       ├── 📜 app.dart
    │       ├── 📂 core
    │       │   └── 📂 common
    │       │       ├── 📂 localization
    │       │       │   └── 📜 app_en.arb
    │       │       ├── 📂 routes
    │       │       │   └── 📜 route_delegate.dart
    │       │       ├── 📂 settings
    │       │       │   ├── 📜 init.dart
    │       │       │   ├── 📜 settings_controller.dart
    │       │       │   └── 📜 settings_service.dart
    │       │       └── 📂 widgets
    │       │           └── 📜 error_page.dart
    │       └── 📂 features
    │           ├── 📂 add
    │           │   ├── 📜 location.dart
    │           │   └── 📂 presentation
    │           │       └── 📂 pages
    │           │           └── 📜 add_page.dart
    │           ├── 📂 favourites
    │           │   ├── 📜 location.dart
    │           │   └── 📂 presentation
    │           │       └── 📂 pages
    │           │           └── 📜 favourites_page.dart
    │           ├── 📂 home
    │           │   ├── 📜 location.dart
    │           │   └── 📂 presentation
    │           │       └── 📂 pages
    │           │           └── 📜 home_page.dart
    │           ├── 📂 keysmith
    │           │   ├── 📜 location.dart
    │           │   └── 📂 presentation
    │           │       └── 📂 pages
    │           │           └── 📜 keysmith_page.dart
    │           ├── 📂 navigation
    │           │   ├── 📂 routes
    │           │   │   └── 📜 router_delegates.dart
    │           │   └── 📂 view
    │           │       ├── 📂 components
    │           │       │   └── 📜 navigation_bar_widget.dart
    │           │       ├── 📂 pages
    │           │       │   └── 📜 navigation_page.dart
    │           │       └── 📂 state
    │           │           └── 📜 navigation_provider.dart
    │           └── 📂 settings
    │               ├── 📂 components
    │               │   └── 📜 location.dart
    │               └── 📂 pages
    │                   └── 📜 settings_page.dart
    ├── 📜 pubspec.lock
    ├── 📜 pubspec.yaml
    ├── 📂 test
    │   ├── 📜 unit_test.dart
    │   └── 📜 widget_test.dart
```
#### What is happening here? 🙇🏽

* The ```lib``` folder contains all the source code of the app.
* The ```main.dart``` is the app's entry point.
* Source code is divide into ```core``` and ```features``` directories.
* ```core``` directory contains all the utilites, services, constants and components used across any and all the features.
* ```features``` directory contains source code for each ***feature*** divided into ```presentation```, ```domain``` and ```data``` layers.

  * #### Presentation Layer
  
    * **State**: Contains the state of a view. The state management call method of domain layer to get data required by the UI and updates the app for any changes made by the user.
      * Location: ```features -> <featurename> -> presentation -> pages -> <featurename>_page.dart```
  
    * **Pages**: Each feature can have multiple nested pages. The ```pages``` folder contains ```<featurename>_page.dart``` file, which must be a ```stateless widget``` and presents a composed view of the feature.
      * Location: ```features -> <featurename> -> presentation -> pages -> <featurename>_page.dart```
  
    * **Views**: Each page can have mutiple ```views```, for example ListView, GridView or a view which is composed of multiple views. The ```view``` can be ```stateless widget``` or a ```stateful widget```, as it is responsible to provide ```state``` to it's nested ```components```.
      * Location: ```features -> <featurename> -> presentation -> views -> <featurename>_<viewname>_view.dart```
  
    * **Components**: a ```component``` is the smallest part of the UI. For example, a button, a chip, an image, a banner, a snackbar etc. Though not necessary, a ```component``` should be highly re-usable. It should always be ```stateless```.
      * Location: ```features -> <featurename> -> presentation -> components -> <featurename>_<componentname>_widget.dart```

  * #### Domain Layer 
  
    **Note: Each layer, except entites, requires abstraction.**
  
    * **Entities**: An ```entity``` contains all the properties which are required to be displayed on a ```page```. It is the most concrete object and it does not change. It does not have any dependacies.
      * Location: ```features -> <featurename> -> domain -> entities -> <entityname>_entity.dart```
  
    * **Usecases**: A use case calls the business logic and provides data requested by the state management in presentation layer.
      * Location: ```features -> <featurename> -> domain -> usecases -> <usecasename>_usecase_impl.dart```
  
    * **repositories**: The ```repository``` is responsible for abstracting the data layer from the rest of the application and providing a way to perform data operations without knowing how the data is stored or retrieved. This directory only contains the abstraction of the repository.
      * Location: ```features -> <featurename> -> domain -> repositories -> <repositoryname>_repository.dart```

  * #### Data Layer
  
    **Note: Each layer, requires abstraction.**
  
    * **repositories**: This directory only contains the implementation of the repository.
      * Location: ```features -> <featurename> -> data -> repositories -> <repositoryname>_repository_impl.dart```
    
    * **datasources**: Provides access to data from external systems such as databases, web services, or file systems.
      * Location: ```features -> <featurename> -> data -> repositories -> <datasourcename>_datasource_impl.dart```
      
    * **datamodels**: Converts the data provided by datasource to the ```entity``` required by the presentation layer.
      * Location: ```features -> <featurename> -> data -> datamodel -> <modelname>_model.dart```

## Attribution

This contributing guide is adapted from the [Contributing Guide of Github Docs](https://github.com/github/docs/blob/main/CONTRIBUTING.md).