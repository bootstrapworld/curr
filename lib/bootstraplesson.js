/*******************************************
 * IDENTIFY OLD VERSIONS
 *******************************************/

function isNewest() {
  // get the current year and season
  var today = new Date();
  var month_num = today.getMonth(); // 0-6 = "Spring", 7-11 = "Fall"
  var today_year = today.getFullYear();
  var today_season;
  if(8 > month_num > 0) today_season = 'Spring'; // give ourselves until Feb to release the Spring version
  else if(month_num > 8) today_season = 'Fall'; // give ourselves until Sept to release the Fall version
  else { console.error('IMPOSSIBLE: unaccounted for month!'); return; }

  // get season from URL
  var url = window.location.href.toLowerCase();
  var url_season = (url.indexOf('fall') !== -1)? "Fall" : "Spring";
  // if it's not the current year or season, add the "obsolete" banner
  var url_current_year = url.indexOf(today_year) !== -1;
  var url_current_season = url_season == today_season;
  var outOfDate = document.createElement('div');
  outOfDate.setAttribute('id', 'outOfDate');
  outOfDate.innerHTML = 'These materials are OUT OF DATE! To get the latest version'
    + ' of the materials, visit <a href="https://www.BootstrapWorld.org/materials">'
    + 'https://www.BootstrapWorld.org/materials</a>';
  document.body.appendChild(outOfDate);
  console.log(url_season, today_season);
  if(!url_current_year || !url_current_season) {
    outOfDate.style.display = 'block';
    console.warn("These materials are OUT OF DATE! To get the latest version"
      + " of the materials, visit www.BootstrapWorld.org/materials");
  }
}


/*******************************************
 * CARD INITIALIZATION AND SCROLLING
 *******************************************/

// for each lesson, initialize the list of cards and set button behaviors
function initializeCards(){
  // if there's no next/prev button, don't initialize
  if(!document.getElementById('prev')){ return; }
  // get all the lessons and cards
  var lessons   = document.getElementsByClassName('LessonBoundary'),
      cardNodes = document.getElementsByClassName('lessonItem'),
      cards     = [].slice.call(cardNodes), // convert NodeList to Array
      lesson    = document.getElementsByClassName('lesson')[0];
  // attach buttons to this lesson
  lesson.prev    = document.getElementById('prev');
  lesson.next    = document.getElementById('next');
  lesson.flip    = document.getElementById('flip');

  // hide all segments after 1 and compile all cards into a single lesson
  for(var i=1; i < lessons.length; i++){ lessons[i].style.display='none'; }
  for(var j=0; j < cards.length;   j++){
    console.log('putting lessonitem '+j+' at the end of the first list. After adding, there are '+(lesson.childNodes.length+1)+' cards');
    lesson.appendChild(cards[j]);
  }

  // set lesson pointers
  lesson.cards = cards;
  lesson.currentCard = 0;

  lesson.prev.lesson = lesson.next.lesson = lesson;

  // draw the lesson and buttons, moving the cards so only the currentCard is visible
  function drawLesson(lesson){
    lesson.prev.disabled = (lesson.currentCard <= 0);
    lesson.next.disabled = (lesson.currentCard >= lesson.cards.length-1);
    var width = lesson.cards[0].offsetWidth;
    lesson.style.left = (-lesson.currentCard * width) + 'px';
  }

  // change the currentCard and redraw the lesson
  lesson.prev.onclick = function(){
    this.lesson.currentCard--;
    drawLesson(this.lesson);
  };
  lesson.next.onclick = function(){
    this.lesson.currentCard++;
    drawLesson(this.lesson);
  };
  lesson.flip.onclick = function(){
    var main = document.getElementsByClassName('main')[0];
    main.className = (main.className.indexOf("flipped") === -1)? "main flipped" : "main";
  }

  drawLesson(lesson);
}

/*******************************************
 * CODE RE-INDENTING
 *******************************************/

// rewrap all REPL content onresize, throttled by 250ms
var rewrapThrottle = null;
var rewrapCodeExps = function(){

  // calculateWidth : node -> number
  // cache and return the width of the current node, and all of its children
  var calculateWidth = function(node){
    node.cachedWidth = 1;
    for(var i = 0; i < node.children.length; i++) {
      node.cachedWidth += (node.children[i].cachedWidth || calculateWidth(node.children[i]));
    }
    node.cachedWidth = Math.max(node.cachedWidth, node.offsetWidth);
    return node.cachedWidth;
  }

  // rewrap a single CodeExp: either every child fits on one line, or they all get their own line
  var rewrapCodeExp = function(node){
    var oldWrap   = node.className.indexOf("wrapped") > -1,      // original wrap state
        expWidth  = node.cachedWidth || calculateWidth(node),   // unwrapped exp width (use cache if possible)
        maxWidth  = node.parentNode.clientWidth,                // maximum width, including padding but not margin
        newWrap   = expWidth > maxWidth;                        // new wrapped state
    // if the wrapping status has changed, update the className and re-check all the children
    if(oldWrap !== newWrap){
      node.className = newWrap? node.className+" wrapped" : node.className.replace(/ wrapped/g, "");
      for(var i = 0; i < node.children.length; i++){ rewrapCodeExp(node.children[i]); }
    }
  }

  // clear the throttle and set timer for rewrapping
  clearTimeout(rewrapThrottle);
  rewrapThrottle = setTimeout(function(){
                              var repls = document.getElementsByClassName('codesexp');
                              for(var i=0; i<repls.length; i++){ rewrapCodeExp(repls[i])};
                              }, 250);
};


/*******************************************
 * CODEMIRROR
 *******************************************/
// forEach method, could be shipped as part of an Object Literal/Module
var forEach = function (array, callback, scope) {
  for (var i = 0; i < array.length; i++) {
    callback.call(scope, i, array[i]); // passes back stuff we need
  }
};
function attachCodeMirror(){
  // translate all the TEXTAREA nodes into full-blown CM instances, and color TTs with runmode
  // (we use the more expensive CM stuff for indenting)
  var codeSnippets = document.querySelectorAll('textarea');
  forEach(codeSnippets, function(idx, textarea){
    if(textarea.className == "racket"){
      CodeMirror.fromTextArea(textarea, {mode:"scheme2", readOnly: "true", cursorBlinkRate: 0});
    } else if(textarea.className == "pyret"){
      CodeMirror.fromTextArea(textarea, {mode:"pyret", readOnly: "true", cursorBlinkRate: 0});
    }
  });

  var codeSnippets = document.querySelectorAll('tt');
  forEach(codeSnippets, function(idx, tt){
    var node = document.createElement('span');
    node.className = 'editbox';
    tt.parentNode.insertBefore(node, tt);
    if(tt.className == "racket" && tt.firstChild){
      CodeMirror.runMode(tt.firstChild.nodeValue, "scheme2", node);
    } else if(tt.className == "pyret" && tt.firstChild){
      CodeMirror.runMode(tt.firstChild.nodeValue, "pyret", node);
    }
    tt.style.display = 'none';
   });
}


// find all lesson lessons in the file, and toggle the notes className for each
function toggleTeacherNotes(button){
  console.log(button.getAttribute('valueShow'))
  button.value = (button.value === button.getAttribute('valueShow'))? button.getAttribute('valueHide'): button.getAttribute('valueShow');
  var lessons = document.getElementsByClassName('lesson');
  for(var i=0; i<lessons.length; i++){
    lessons[i].className = (lessons[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
  }
}

function showGroup(){
  window.open("https://groups.google.com/forum/embed/?place=forum/bootstrap-discuss", "_blank");
}

/*******************************************
 * SLIDE MODE
 *******************************************/
function showSlides() {

  // restore everything to pre-slide state
  function hideSlides() {
    // grab the current slide element (if there is one)
    var oldSlideElement = document.getElementsByClassName('slide')[0];
    if(oldSlideElement){ oldSlideElement.classList.remove('slide'); }
    // restore everything to pre-slide state
    document.getElementById('lessonToolbar').style.display = 'block';
    document.body.style.visibility = 'visible';
    document.body.removeEventListener("keydown",    handleKey);
    document.body.removeEventListener("touchstart", handleTouchStart);
    document.body.removeEventListener("touchend",   handleTouchEnd);
    document.body.removeChild(progress);
    [].slice.call(document.getElementsByClassName('slideText')).forEach(function(arg) {
    arg.style.display = "none";});
     [].slice.call(document.getElementsByClassName('noSlideText')).forEach(function(arg) {
    arg.style.display = "inline";});

  }

  function moveSlideToIndex(i) {
    var oldSlideElement = document.getElementsByClassName('slide')[0];
    // remove the slide class from the old element.
    if(oldSlideElement){ oldSlideElement.classList.remove('slide'); }
    cards[window.index].classList.add('slide');
    progress.style.width = (window.index+1) * (100 / cards.length) + "%";
  }

  function handleKey(e){
    // change the index
    if( (e.keyCode == RIGHTARROW || e.keyCode == SPACE) && (window.index < cards.length-1) ){
      e.preventDefault();
      window.index++;
    } else if((e.keyCode == LEFTARROW) && (window.index > 0) ){
      window.index--;
    } else if(e.keyCode == ESCAPE){
      hideSlides();
      return;
    } else {
      return; // ignore all other keypresses
    }
    moveSlideToIndex();
  }

  function handleTouchStart(e) {
    xStart = e.touches[0].clientX;
    yStart = e.touches[0].clientY;
    startTime = new Date().getTime()
  }

  function handleTouchEnd(e) {
    if(!xStart || !yStart) { return; } // Shouldn't happen: give up if touchstart wasn't called first
    var xDiff = xStart-e.changedTouches[0].clientX;
    var yDiff = yStart-e.changedTouches[0].clientY;
    var longEnough = (new Date().getTime() - startTime) > 250 // get time elapsed
    var movedEnough = Math.abs(xDiff) > 50 || Math.abs(yDiff) > 150;

    if(longEnough && movedEnough) {
      if(Math.abs(xDiff) >= Math.abs(yDiff)) { // we only care if it was a horizontal swipe
        window.index += (xDiff > 0)? 1 : -1;
        moveSlideToIndex();
      } else if(yDiff > 250){
        hideSlides();
      }
    }
    xStart = yStart = null;    // reset for next time
  }

  // initial positions and keyCodes
  var xStart = yStart = startTime = null;
  var RIGHTARROW= 39;
  var LEFTARROW = 37;
  var SPACE     = 32;
  var ESCAPE    = 27;


  var cardNodes = document.querySelectorAll(".student"), //,.BootstrapPageTitle
      cards     = [].slice.call(cardNodes).filter(function(card) {
        return card.getElementsByClassName('BS-Skip-Slide').length === 0;}),// convert NodeList to Array, remove slides to be skipped
      progress  = document.createElement('div');
  progress.id = 'progressBar';
  document.body.appendChild(progress);
  progress.style.width = (100 / cards.length) + "%";

  // make slide text visible
  [].slice.call(document.getElementsByClassName('slideText')).forEach(function(arg) {
    arg.style.display = "inline";});

  [].slice.call(document.getElementsByClassName('noSlideText')).forEach(function(arg) {
    arg.style.display = "none";});





  // hide non-slide content
  document.getElementById('lessonToolbar').style.display = 'none';
  document.body.style.visibility = 'hidden';

  // set up index, and assign keydown listener
  window.index = 0;
  document.body.addEventListener("keydown", handleKey);
  document.addEventListener('touchstart',   handleTouchStart, false);
  document.addEventListener('touchend',    handleTouchEnd, false);
  cards[0].classList.add('slide');
}

/*******************************************
 * EVENT HANDLERS
 *******************************************/
window.addEventListener("resize", function(){
  rewrapCodeExps();
});

window.addEventListener("load", function() {
  isNewest();
  attachCodeMirror();
  initializeCards();
  rewrapCodeExps();
});
