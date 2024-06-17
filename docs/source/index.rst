.. openscad-py documentation master file, created by
   sphinx-quickstart on Fri May 31 19:23:36 2024.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

=========================
OpenSCAD-Py Documentation
=========================

Introduction
============

OpenSCAD-Py is a Python wrapper for the OpenSCAD library, designed to enable easy and intuitive usage. This library aims to:

- Provide all basic OpenSCAD objects with the same signatures to ensure users are not confused.
- Support operators |, &, -, and << for union, intersection, difference, and concatenation (parent/child relationships) of different objects.
- Offer selectors on an instance to retrieve a list of sub-objects that match a predicate, allowing for further processing (adding new objects, transformations, or modifying properties).

Operators
=========

.. doctest:: python

   >>> from openscad_py.objects_2d import Circle, Square
   >>> circle = Circle(10)
   >>> square = Square(20)

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. code-block:: python

         >>> circle | square

      .. container:: flex

         .. image:: _static/index_union.png

   .. container:: flex-column code-block-with-img

      .. code-block:: python

         >>> circle & square

      .. container:: flex

         .. image:: _static/index_intersection.png

.. container:: flex-row gap
 
   .. container:: flex-column code-block-with-img

      .. code-block:: python

         >>> circle - square

      .. container:: flex

         .. image:: _static/index_difference.png

   .. container:: flex-column code-block-with-img

      .. code-block:: python

         >>> circle ^ square

      .. container:: flex

         .. image:: _static/index_symmetrical_difference.png

Selectors
=========

.. container:: flex-column code-block-with-img

   .. code-block:: python

      >>> from openscad_py.objects_2d import Circle, Square
      >>> from openscad_py.objects_3d import Cylinder
      >>> from openscad_py.transformations import Color, Translate
      >>> example = (Square(20)
      ...     | Circle(5)
      ...     | Translate.X(20) << Circle(10)
      ...     | Translate.Y(20) << Circle(15)
      ...     | Translate([20, 20, 0]) << Circle(20))
      >>> example

   .. container:: flex

         .. image:: _static/index_selector.png

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - assignment

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle)
         ... ] = Circle(12.5)
         >>> example 

      .. container:: flex

         .. image:: _static/index_selector_setitem.png

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - assignment with lambda

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle) 
         ...      and x.r < 8
         ... ] = lambda x: Square(x.r * 2, True)
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_setitem_lambda.png

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - union

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle)
         ... ] |= Cylinder(h=5, r=4)
         >>> example 

      .. container:: flex

         .. image:: _static/index_selector_or.png

   .. container:: flex-column code-block-with-img

      .. container:: title
         
         Selector - union with lambda

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle) 
         ... ] &= lambda x: Cylinder(
         ...   h=5, r=x.r - 1
         ... )
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_or_lambda.png


.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - intersection

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle)
         ... ] &= Square(12, center=True)
         >>> example 

      .. container:: flex

         .. image:: _static/index_selector_and.png

   .. container:: flex-column code-block-with-img

      .. container:: title
         
         Selector - intersection with lambda

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle) 
         ... ] &= lambda x: Square(
         ...   x.r * 2 * 0.9, center=True
         ... )
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_and_lambda.png

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - difference

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle)
         ... ] -= Circle(4)
         >>> example 

      .. container:: flex

         .. image:: _static/index_selector_minus.png

   .. container:: flex-column code-block-with-img

      .. container:: title
         
         Selector - difference with lambda

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle) 
         ... ] -= lambda x: Circle(x.r - 1)
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_minus_lambda.png

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - symmetrical difference

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle)
         ... ] ^= Square(12, center=True)
         >>> example 

      .. container:: flex

         .. image:: _static/index_selector_xor.png

   .. container:: flex-column code-block-with-img

      .. container:: title
         
         Selector - symmetrical difference with lambda

      .. code-block:: python

         >>> example[
         ...   lambda x: isinstance(x, Circle) 
         ... ] ^= lambda x: Square(
         ...   x.r * 2 - 2, center=True
         ... )
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_xor_lambda.png

.. container:: flex-row gap

   .. container:: flex-column code-block-with-img

      .. container:: title

         Selector - delete

      .. code-block:: python

         >>> del example[
         ...   lambda x: isinstance(x, Circle) 
         ...      and x.r > 8
         ... ]
         >>> example

      .. container:: flex

         .. image:: _static/index_selector_delitem.png

Here is a quick example to demonstrate the basic usage of OpenSCAD-Py:

.. doctest:: python

   >>> from openscad_py.objects_3d import Cube
   >>> from openscad_py.transformations import Translate
   >>>
   >>> # let create a simple table with 4 legs
   >>> table = Translate.Z(10) << Cube([11, 11, 1])
   >>> for x in [0, 10]:
   ...    for y in [0, 10]:
   ...       table |= Translate([x, y, 0]) << Cube([1, 1, 10])
   >>> table
   union() {
       translate(v=[0, 0, 10])
       cube(size=[11, 11, 1]);
       translate(v=[0, 0, 0])
       cube(size=[1, 1, 10]);
       translate(v=[0, 10, 0])
       cube(size=[1, 1, 10]);
       translate(v=[10, 0, 0])
       cube(size=[1, 1, 10]);
       translate(v=[10, 10, 0])
       cube(size=[1, 1, 10]);
   }

   

Getting Started
===============

Installation
------------

To install the OpenSCAD-Py package, use pip:

.. code-block:: bash

    pip install openscad-py

Basic Usage
-----------

Here are some basic usage examples to get you started.

.. doctest::
   >>> from openscad_py.subsystem import Circle, Square
   >>> print(Circle(10) | Square(10))
   union() {
      circle(
         r=10
      );
      square(
        size=[10, 10]
      );
   }

.. toctree::
   :maxdepth: 4

   modules


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
