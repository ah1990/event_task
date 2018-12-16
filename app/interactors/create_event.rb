class CreateEvent
  include Interactor::Organizer

  organize EventCreator, SuitableUsers,
           EmailNotifier, WebPushNotifier
end