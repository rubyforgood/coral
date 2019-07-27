if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: '/' })
    .then(function(reg) {
      var registrationEvent = new Event('serviceWorkerRegistered');
      document.dispatchEvent(registrationEvent);
      console.log('[Companion]', 'Service worker registered!');
    });
}
