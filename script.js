document.addEventListener('DOMContentLoaded', () => {
    console.log('RailStream Script Initialized');

    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', (e) => {
            console.log('Form submission intercepted for demo.');
        });
    });
});
