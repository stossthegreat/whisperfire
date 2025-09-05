(function(){
  if (!window.Tesseract) {
    console.warn('Tesseract.js not loaded');
    window.ocrRecognize = async function() { throw new Error('Tesseract not available'); };
    return;
  }
  window.ocrRecognize = async function(imageDataUrl) {
    const { createWorker } = window.Tesseract;
    const worker = await createWorker('eng');
    try {
      const { data: { text } } = await worker.recognize(imageDataUrl);
      return text || '';
    } finally {
      await worker.terminate();
    }
  };

  // Open a file picker, read the image as DataURL, and OCR it
  window.pickAndOcr = function() {
    return new Promise((resolve, reject) => {
      try {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.onchange = async () => {
          const file = input.files && input.files[0];
          if (!file) { resolve(''); return; }
          const reader = new FileReader();
          reader.onload = async (e) => {
            try {
              const dataUrl = e.target.result;
              const text = await window.ocrRecognize(dataUrl);
              resolve(text || '');
            } catch (err) {
              reject(err);
            }
          };
          reader.onerror = reject;
          reader.readAsDataURL(file);
        };
        input.click();
      } catch (e) {
        reject(e);
      }
    });
  };
})(); 