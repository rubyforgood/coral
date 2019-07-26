export function register() {
  // Check that service workers are supported
  if ('serviceWorker' in navigator) {
    // Use the window load event to keep the page load performant
    window.addEventListener('load', () => {
      console.log("theoretically registering service worker")
      navigator.serviceWorker.register('/packs/service-worker.js');
    });
  } else {
    console.log("service workers not supported; cannot use offline.")
  }
}

export function worker() {
  console.log("service worker registered")
}