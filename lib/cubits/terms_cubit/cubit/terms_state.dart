part of 'terms_cubit.dart';

sealed class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

final class TermsInitial extends TermsState {}

final class TermsLoading extends TermsState {}

final class TermsLoaded extends TermsState {}

final class TermsError extends TermsState {}
