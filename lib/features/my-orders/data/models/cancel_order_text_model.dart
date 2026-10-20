class CancelOrderTextModel {
  final int id;
  final String text;

  CancelOrderTextModel({required this.id, required this.text});
}

List<CancelOrderTextModel> cancelOrderTextList = [
  CancelOrderTextModel(id: 1, text: 'Ordered by mistake'),
  CancelOrderTextModel(id: 2, text: 'Changed my mind'),
  CancelOrderTextModel(id: 3, text: 'Order Taking too long to prepare'),
  CancelOrderTextModel(id: 4, text: 'Wrong item ordered'),
  CancelOrderTextModel(id: 5, text: 'Order not received'),
  CancelOrderTextModel(id: 6, text: 'Found a better price elsewhere'),
  CancelOrderTextModel(id: 7, text: 'Payment issue'),
  CancelOrderTextModel(id: 8, text: 'Restaurant Requested Cancellation'),
];
