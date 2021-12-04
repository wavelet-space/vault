window.onload = function () {

  var c = document.getElementById("canvas");
  c.addEventListener("click", onClick, false)
  var ctx = c.getContext("2d");

  ctx.canvas.width = "90"
  ctx.canvas.height = "90"

  var tracers = [];

  var is_paused = false;

  window.onblur = function () {
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
    let w = 3;
    let h = 3;
    ctx.fillStyle = "#ff0000";
    ctx.fillRect((c.width / 2) - (w/2), (c.height / 2) - (h/2), w, h)
    ctx.fillStyle = "#fff";
  }

  function unpause() {
    is_paused = false;
  }

  /*
   * Retrun the tracer object drawed as circle shape.
   */
  const Tracer = ({ x, y }) => ({
    x: x,
    y: y,

    draw: function () {
      ctx.fillStyle = "#fff";
      ctx.fillRect(this.x, this.y, 0.5, 0.5);
      ctx.fill()
    },

    update: function (canvas) {
      var xp = (this.x - canvas.width / 2) / canvas.width;
      var yp = (this.y - canvas.height / 2) / canvas.height;
      this.x += (1 * xp * xp - yp * yp) / (Math.pow(xp * xp + yp * yp, 1.5))
      this.y += (1.5 * xp * yp) / (Math.pow(xp * xp + yp * yp, 1.5))
    }
  })

  function clearCanvas() {
    ctx.clearRect(0, 0, c.width, c.height);
    tracers.forEach(function (tracer, i) {
      if ((tracer.x < 0) || (tracer.x > c.width) || (tracer.y < 0) || (tracer.y > c.height)) {
        tracers.splice(i, 1);
      }
      tracer.draw();
    })
    ctx.fillStyle = "#022b69";
    // ctx.fillRect(0, c.height / 2, c.width, 0.5);
  }

  function update(canvas) {
    tracers.forEach(function (tracer) {
      tracer.update(canvas);
    })
  }

  function render(canvas) {
    clearCanvas();
    tracers.forEach(function (tracer) {
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

    let rand = 1.5;
    let n_tracer = 10;
    let step = c.height / n_tracer;

    for (var x = step / 30; x < c.width; x += step) {
      for (var y = step / 30; y < c.height; y += step) {
        tracers.push(
          Tracer({
            x: x + rand * (Math.random()),
            y: y + rand * (Math.random())
          })
        );
      }
    }
  }

setInterval(addTracers, 100);
setInterval(loop, 1000 / 60);
}