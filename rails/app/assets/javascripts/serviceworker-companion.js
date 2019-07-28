if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: '/' })
    .then(function(reg) {
      var registrationEvent = new Event('serviceWorkerRegistered');
      document.dispatchEvent(registrationEvent);
      console.log('[Companion]', 'Service worker registered!');

      reg.addEventListener('updatefound', () => {
        // A wild service worker has appeared in reg.installing!
        const newWorker = reg.installing;
    
        newWorker.state;
        // "installing" - the install event has fired, but not yet complete
        // "installed"  - install complete
        // "activating" - the activate event has fired, but not yet complete
        // "activated"  - fully active
        // "redundant"  - discarded. Either failed install, or it's been
        //                replaced by a newer version
    
        newWorker.addEventListener('statechange', () => {
          console.log(`New Worker State: ${newWorker.state}`)
  
        });
      });
    
    });
}
