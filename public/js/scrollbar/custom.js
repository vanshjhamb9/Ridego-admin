// Initialize SimpleBar only if the element exists
// Wait for DOM to be ready
(function() {
    function initSimpleBar() {
        var myElement = document.getElementById('simple-bar');
        if (myElement) {
            try {
                new SimpleBar(myElement, { autoHide: true });
            } catch (e) {
                console.warn('SimpleBar initialization failed:', e);
            }
        }
    }
    
    // Initialize immediately if DOM is ready, otherwise wait
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initSimpleBar);
    } else {
        initSimpleBar();
    }
})();