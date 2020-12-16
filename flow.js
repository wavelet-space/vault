window.onload = function () {

var c = document.getElementById("canvas");
c.addEventListener("click", onClick, false)
var ctx = c.getContext("2d");

var tracers = [];

var is_paused = false;

window.onblur = function() {
  if (!is_paused) {
    pause();
  }
};

function onClick() {
  if (is_paused) {
    unpause();
  } else {
    pause();
  }
}

function pause() {
  is_paused = true;
  ctx.globalAlpha=0.7;

  ctx.fillRect(270, 260, 20, 60)
  ctx.fillRect(310, 260, 20, 60)

  ctx.font = "10px Arial";
  ctx.fillText("Click to unpause",250,500);
  ctx.globalAlpha=1;
}

function unpause() {
  is_paused = false;
}

/*
 * Retrun the tracer object drawed as circle shape.
 */
const Tracer = ({x, y}) => ({
    x: x,
    y: y,

    draw: function() {
      ctx.fillStyle = "#022b69";
      ctx.fillRect(this.x,this.y, 1, 0.5);
      ctx.fill()
    },

    update: function(canvas) {
      var xp = (this.x - canvas.width / 2 ) / canvas.width;
      var yp = (this.y - canvas.height / 2) / canvas.height;
      this.x += (1 * xp * xp - yp * yp) / (Math.pow(xp * xp + yp * yp, 1.5))
      this.y += (1.5 * xp * yp) / (Math.pow(xp * xp + yp * yp, 1.5))
    }
 })

function clearCanvas() {
  ctx.clearRect(0, 0, c.width, c.height);
  tracers.forEach(function(tracer, i) {
    if ((tracer.x < 0) || (tracer.x > c.width) || (tracer.y < 0) || (tracer.y > c.height)) {
      tracers.splice(i, 1);
    }
    tracer.draw();
  })
  ctx.fillStyle = "#022b69";
  ctx.fillRect(0, c.height/2, c.width, 0.5);
}

function update(canvas) {
  tracers.forEach(function(tracer) {
    tracer.update(canvas);
  })
}

function render(canvas) {
  clearCanvas();
  tracers.forEach(function(tracer) {
    tracer.draw(c);
  })
}

function loop() {
  if (!is_paused) {
    update(c);
    render(c);
  }
}

function addTracers() {
  if (is_paused) { return }
  
  let rand = 1;
  let n_tracer =10;
  let step = c.height / n_tracer;
  
  for (var x = step / 30; x < c.width; x += step) {
  for (var y = step / 30; y < c.height; y+= step) {
      tracers.push(
          Tracer({
              x: x + rand * (Math.random() - 0.15), 
              y: y + rand * (Math.random() - 0.15)
          })
      );
  }
  }
}

setInterval(loop, 1000/60);
setInterval(addTracers, 1000/1);

}