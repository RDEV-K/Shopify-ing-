var ele = document.getElementById('container');
if (ele) {
  ele.style.visibility = 'visible';
}
var ele = document.getElementById('container');
if (ele) {
  ele.style.visibility = 'visible';
}

// RichTextContent
let richTextContent = null;

// delay time to save content
const delayTime = 5;
let newInput = true;

// possible ctrl key
const keys = ['v', 'b', 'j', 'i', 'u', 'r', 'e', 'l'];


// saving counter
let savingCounter = 0;
let autoSaveContent = '';

// initialize Rich Text Editor component
var RichTextEditor = new ej.richtexteditor.RichTextEditor({
      insertImageSettings: {
         path: path_var,
         saveFormat: 'Base64',
         saveUrl: saveUrl_var,
        },
});

// Render initialized Rich Text Editor.
RichTextEditor.appendTo('#defaultRTE');

RichTextEditor.contentModule.getDocument().addEventListener('input', function (e) {
  e.preventDefault(); // to prevent default ctrl+s action
  if (savingCounter > (delayTime - 1) || newInput) {
    newInput = false;
    delaySaving(RichTextEditor);
  }
  savingCounter = 0;
});

RichTextEditor.contentModule.getDocument().addEventListener('drag', async function (e) {
  if (savingCounter > (delayTime - 1) || newInput) {
    newInput = false;
    delaySaving(RichTextEditor);
  }
  savingCounter = 0;
});
  RichTextEditor.contentModule.getDocument().addEventListener('keydown', async function (e) {
  if (keys.includes(e.key) && e.ctrlKey === true) {
      await getText().then(textContent => saveContent(textContent));
  }
  if ( e.key === 's' && e.ctrlKey === true) {
    e.preventDefault(); // to prevent default ctrl+s action
    await getText().then(textContent => saveContent(textContent));
  }

});

async function getText() {
  return new Promise((res, rej) => {
    setTimeout(() => {
      RichTextEditor.updateValue(); // to update the value after editing
      res(RichTextEditor.value); // return the RTE content    
    }, 100);
  });
}

// this will continue updating saving counter
setInterval(() => {
  savingCounter += 1;
}, 1000);

const delaySaving = RichText => {
  let toSave = checkDelay(delayTime);
  toSave.then(async (toSav) => {  
    if (toSav) {
      await getText().then(textContent => saveContent(textContent));
    }
  });
};

const checkDelay = (expectSecs) => {
  return new Promise((res, rej) => {
    let checkSave = setInterval(() => {
      if (savingCounter === expectSecs) {
        clearInterval(checkSave);
        res(true);
      }
    }, 1000);
  });
};

const saveContent = content => {
  autoSaveContent = content;
  $.ajax({
    type: "post",
    url: saveTextUrl,
    data: {content,journal_id},
    dataType: "json",
    success: function (response) {
      if (!$.isEmptyObject(response)) {
        journal_id = response.journal_id;
      }
    }
  });
}

setInterval(async () => {
  await getText().then(textContent => saveContent(textContent));
  console.log('saved');
}, 1000);