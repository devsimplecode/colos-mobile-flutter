# COLOS
![Logo](https://github.com/GaLenN3228/portfolio_preview/blob/main/assets/colos_logo.png?raw=true)

## About app

COLOS is an application for tracking your shipments. Also, different roles could work in this application, such as a dispatch operator, a regular user, and a project client. The functionality for each role has been limited or expanded depending on the role. Each shipment can be tracked on a map, with an accurate calculation of its location and a history of movement

## Features

- Multi-language support
- Theme switching
- Google maps polyline drawing and custom icons


## Multi-language support

Multi-language implementation

We used BLoC pattern for localization. 

```bash
   BlocBuilder<BlocLocale, StateBlocLocale>(
        bloc: widget.blocLocale,
        builder: (context, state) {
```

```bash
  MaterialApp.router(
    supportedLocales: widget.blocLocale.supportedLocales,
    scaffoldMessengerKey: scaffoldMessengerKey,
    debugShowCheckedModeBanner: false,
    locale: widget.blocLocale.uiLocale,
    localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ],
```

## Theme switching

Theme switching implementation the same as Multi-language implementation


```bash
    return BlocBuilder<BlocAppTheme, StateAppTheme>(
            bloc: widget.blocTheme,
            builder: (context, _state) {
              return InitWidget(
                blocTheme: widget.blocTheme,
```



<p align="center">
  <img src="https://github.com/GaLenN3228/portfolio_preview/blob/main/assets/theme_and_language.gif" alt="animated" />
</p>

