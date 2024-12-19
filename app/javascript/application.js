 import "@hotwired/turbo-rails"
import "controllers"

// Disable Turbo drive by default
Turbo.session.drive = false

// Add CSRF token to all requests *For some reason this doesnt work*
let token = document.querySelector('meta[name="csrf-token"]')?.content;
if (token) {
  document.addEventListener('turbo:before-fetch-request', (e) => {
    e.detail.fetchOptions.headers['X-CSRF-Token'] = token;
  });
}
