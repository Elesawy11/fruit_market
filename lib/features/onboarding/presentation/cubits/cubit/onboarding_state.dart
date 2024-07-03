part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}
final class IncreaseIndex extends OnboardingState {}
final class LastIndex extends OnboardingState {}
