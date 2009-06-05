import toxi.math.*;

/**
 * Demonstration & visualization of space deformation, showing both displacement
 * curve and result applied to a regular arrangement of lines. The lens logic is
 * encapsulated in a re-usable class of its own and additionally features
 * value smoothing and displacement strength. Using the strength value we can
 * specify a concave or convex lens type, either bundling or dilating the space
 * around the focal point.
 * 
 * @author toxi
 * 
 */

/* 
 * Copyright (c) 2009 Karsten Schmidt
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

ZoomLensInterpolation zoomLens = new ZoomLensInterpolation();

float smoothStep=0.15;

void setup() {
  size(800, 400);
}

void draw() {
  background(255);
  zoomLens.setLensPos((float) mouseX / 400,smoothStep);
  zoomLens.setLensStrength((mouseY - height * 0.5f) / (height * 0.5f),smoothStep);
  for (float x = 0; x < 400; x++) {
    float t = x / 400;
    float y = zoomLens.interpolate(0, 400, t);
    // draw lines at regular interval (but displaced by lens)
    if (0 == x % 10) {
      line(y, 0, y, height);
    }
    // draw displacement curve for each pixel
    point(y + 400, x);
  }
}

