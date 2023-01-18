# portfolio_preview


## Animated theme switcher and multilingual support

![](https://github.com/GaLenN3228/portfolio_preview/blob/main/assets/theme_and_language.gif)


erDiagram
    API ||--|| CONTROLLER : raw-data
    CONTROLLER ||--|| SERVICE : valid-data
    CONTROLLER ||--|| REQUEST : validate
    SERVICE }|--|{ REPOSITORY : model
    SERVICE }|--|{ PRESENTER : array-response
    REPOSITORY ||--|| DB-TABLE : model-data
