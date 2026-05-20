sealed class OnBoardingState {
  const OnBoardingState();
}

final class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial();
}

final class OnBoardingLoading extends OnBoardingState {
  const OnBoardingLoading();
}

final class OnBoardingFirstTime extends OnBoardingState {
  const OnBoardingFirstTime();
}

final class OnBoardingCompleted extends OnBoardingState {
  const OnBoardingCompleted();
}

final class OnBoardingFailure extends OnBoardingState {
  const OnBoardingFailure(this.message);

  final String message;
}
