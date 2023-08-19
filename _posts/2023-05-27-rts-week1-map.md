---
layout: post
title: glCombat - Week 1 - Map
tags: opengl gamedev c development
author: Steve SCHNEPP
---

One week has passed. As usually wih new projects lots has happened.

# Initial steps

Beginnings are always similar, as it is mostly a copy/paste of some tutorial
code.

Here, I started with a simple SDL2+OpenGL codebase. The first step being to
understand how to write a triangle, then rotating it.

The various links I used:

* https://www.glprogramming.com/red/index.html
* https://learnopengl.com/Introduction
* https://lazyfoo.net/tutorials/OpenGL/index.php

If you are wondering about those links being old, it is because they are.
Remember that I want to only use OpenGL 1.2.

# Findings

Camera positioning is hard to understand.
{: .panel .warning}

I spend a huge amount of time trying to implement a simple moving camera
that is controlled with user input. As of today it is working acceptably but
I have to revisit that later.

Lighting has some surprises.
{: .panel .note}

I'm drawing objects with a simple `glBegin(TRIANLE_LIST)` and `glEnd()` pair
that contains a huge loop of `glVertex3f()` for the vertices and
`glColor3f()` for the color of that vertex.

It works nicely, but When I switched the lights on, everything went dark.
The `LIGHT0` has correct default values, but the normals are **mandatory** for
each vertex. I thought that they would get automatically computed from the
triangle, as well, they *could be*. But that was naive.

So you **need** to pass normals to have light processed[^1].

[^1]: in modern OpenGL you'll use shaders, so that fixed pipeline for
      lighting doesn't exist anymore.

Then once passing the normals, everything was colorless again, the infamous
clay was back. Here also, lighting only works with `glMaterial()` and not
`glColor()`. The latter is only used when doing light computation manually[^2].

[^2]: Not exactly. `glColor` can also be leveraged to quickly change parts of
      `glMaterial()` but let's keep it simple.

It is very easy to be distracted and spend way to much time on some useless
feature.
{: .panel .note}

On the other hand, a seemingly unimportant bug is very important to adequate
time on. As usually it hides some misunderstanding, and that is very nasty
later.

Simple color/lighting effects are a rather cheap but very effective way to add eye candy.
{: .panel .tip}

## Simple can be effective

As my naive implementation was performing quite well on even an old laptop
with a i945 graphics chip, I was wondering what was happening behind the
scene.

I used a model from the [Utah teapot with 150k
vertices](https://users.cs.utah.edu/~dejohnso/models/teapot.html), and it
was still mostly smooth.

I activated the [debug vars from Mesa](https://docs.mesa3d.org/envvars.html) and it showed that the openGL library
did some batching prior to sending it to the HW, so even my naive
programming was only having the overhead of a function call.

This is an example of where I spent way too much time on tangents,
but as the whole purpose of the project is to learn it isn't that bad.
Moreover, since I'm writing about it, it isn't lost information at all.
{: .panel .info}

# Overall Architecture

A game typically had a very common architecture, and here we won't be novel.

Those are the main domains:
* drawing
* input handling
* model updates

For drawing, I decided to have a very generic way to push triangles to the
screen : we only draw Objects, lights and UI.

I'm aiming at coding a data driven game engine. So no complex scripting, but
every entity is represented by a file that can be loaded (and eventually
reloaded). For behaviors themselves, having them in a file will come much
later.

For input handling, I fully leverage SDL as it does already abstracts the native
input controls of the platform. So no need to be clever there.

For model updates, I'm planning to learn about the ECS pattern, which is also
very common in gaming. On the multiplayer side, I've not decided yet,
but I would prefer to have a dedicated server that handles all the game updates
and have "dumb" clients. This would enable "hop on / hop off" which is unique 
to GC and typical for FPS.

So nothing really novel here.

## Objects

As stated earlier, each object is represented by a file.

The format being the well known [OBJ
format](https://en.m.wikipedia.org/wiki/Wavefront_.obj_file).  It is textual
so it can be understood easily and very standard. The in-memory structure is
closely aligned to the format as it fits the graphic pipeline quite well
already.

This enables to have only 1 code path that does the rendering, just calling
it with all the objects.

## Maps

Even for drawing the map, I'm using the object way. The map data is read
from a heightmap file that is also textual. Then while reading it I convert
it t9 2 parts: the heightmap and the drawing object.

Tesselation and normals are computed only once : when loading the map file.
It has 2 parts : heightmap and object. The heightmap is also as a textual
format. I wrote an image to map converter as images are the most convenient
way of creating heightmap. I'm simply using the RGB24 value of each pixel as
an integer, it does work nicely when using grayscale while permitting higher
resolution if needed.

## Map Tesselation

From a heightmap, each map element is a quad that has its vertex on a X/Y grid, and the Z is done by the height of the pixel from the heightmap image.

As that quad is mostly never planar, it needs to be split in 3 triangles.

The simplest way is to always split the same way. I chose SW-NE. Yet this looks awkward on the quads that have their main slope change on that diagonal.

So I computed the normal of the SW corner and the one from the SE corner. The corner with the smallest normal magnitude was the one with the biggest curvature and therefore needed to be split.

This enhanced quite nicely the looks of the map.

But i got hinted that i should simply split the quad in 4 triangles, having each a vertex at the middle which is the average of all the vertices.

While it doubles the amount of triangles, it is much simpler to code and looks much better also. So a nice hint indeed.

# Future

Next week, the plan is to have several units roaming on the map.

Keep tuned!
