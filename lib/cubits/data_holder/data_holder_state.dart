part of 'data_holder_cubit.dart';

abstract class DataHolderState extends Equatable {
  const DataHolderState();

  @override
  List<Object> get props => [];
}

class DataHolderLoading extends DataHolderState {}

class DataHolderInitial extends DataHolderState {
  final List<Brand> brands;

  const DataHolderInitial({required this.brands});
  @override
  List<Object> get props => [brands];
}
