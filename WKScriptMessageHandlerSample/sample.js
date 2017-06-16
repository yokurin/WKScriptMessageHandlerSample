window.addEventListener("load", function(event) {
    webkit.messageHandlers.sample1Handler.postMessage({
        type: 'load',
        handler: 'sample1',
        text: "load_1",
    });
});

window.addEventListener("load", function(event) {
    webkit.messageHandlers.sample1Handler.postMessage({
        type: 'load',
        handler: 'sample1',
        text: "load_2",
    });
});

window.addEventListener("load", function(event) {
    webkit.messageHandlers.sample2Handler.postMessage({
        type: 'load',
        handler: 'sample2',
        text: "load_1",
    });
});
