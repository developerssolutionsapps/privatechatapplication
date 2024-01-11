part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  ThemeState({required this.themeType});

  final String themeType;

  @override
  List<Object?> get props => [themeType];
  ThemeState copyWith({String? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }
}

class ChangedTheme extends ThemeState {
  ChangedTheme({required super.themeType});
}
