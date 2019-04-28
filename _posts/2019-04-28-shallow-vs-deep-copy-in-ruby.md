---
layout: post
title: "Shallow Copy vs. Deep Copy in Ruby"
date: 2019-04-28 02:13:41 -0500
---

Recently I have started a new part-time thing, mentoring students who are attending code camps on various major universities.
This has caused me to delve into subjects and areas of programming that I had not visited for some time.
The fundamentals mostly, and areas which are important to programmers in training. This is what the students need
and honestly I am enjoying it also.

One of the programming challenges present in the class lessons involves learning about the [Array](https://ruby-doc.org/core-2.5.3/Array.html)
datatype through creation of a structure that represents the pixels in an image. The student is tasked with 
storing the "pixel" data, which is either 1 or 0, in a 2-dimensional array which corresponds to the rows and 
columns in an image. Simply put, for a 4 x 4 image you will have a four rows or four 1s or 0s. The challenges 
continue to build upon this data structure by having the students figure out how to manipulate it in various ways
and to various ends.

### Enter the 2D Array
As an example, let us see seme code. The initial `Image` class has a ctor that takes in the 2D array containing
its 1s and 0s of *pixel data*. And looks something like this:
{% highlight ruby %}
class Image
    def initialize(array)
      @values = array
    end

    def output_image
        @new_string = ''
        @values.each do |x|
        x.each do |cell|
          @new_string += cell.to_s
        end
        puts @new_string
        @new_string = ''
     end
     puts ""
end
{% endhighlight %}
Usage of which is provided as part of the *make this code work* challenge. And the provided calls look like this:
{% highlight ruby %}
Image.new([
    [0,0,0,0],
    [0,1,0,0],
    [0,0,0,1],
    [0,0,0,1]
])
{% endhighlight %}
This call to the class constructor stores this 2D array in a class variable as shown, called `@values` and it
is accessed when needed to display the data in the `output_image` method. Simple so far, but the challenge builds
upon this with the next requirement.

>Overall this is a great lesson for the fundamentals and led me to dive
>into other topics like the [SOLID principles](https://en.wikipedia.org/wiki/SOLID) 
>and [recursion](https://en.wikipedia.org/wiki/Recursion) and an example of the
>[fibonacci sequence](https://www.wolframalpha.com/input/?i=fibonacci+sequence) all
>of which were excellent building topics for the students...

The next requirement for the challenge only matters for the sake of this post, in that it required me to point 
the student toward iterating through the 2D array. And at the same time, alter the data in the array based upon
the current position. To satisfy your curiosity I will say though. We were to add onto the `Image` class with a 
method called `blur` that would look for 1s and if found would also flip the values above, below, left, and right 
of the found 1 into 1s also.

It is important to note that my experience led me to the next decision, which was to copy the array into a new
variable and use the new copy for iterating and thus be able to alter the class variable `@values`. I have always
been told to not alter a collection you are iterating through lest you mess up the iteration by doing so. 
Specifically if removing values or altering values that are used in a conditional.

Anyways, suffice it to say we needed to copy the 2D array. And therein we find the subject of this post, finally!

### Shallow Copy in Ruby
I did a quick search for how to copy an array in Ruby and came up easily with the `dup` method. And it is important
to note that making copies of simple objects is easy and is the intended purpose of the `dup` method. Take the 
following as an example:
{% highlight ruby %}
array_one = [1,2,3]
array_two = array_one
array_two << 4
array_one.inspect  # [1,2,3,4]
{% endhighlight %}
This example shows that you cannot do a simple value copy on an Array instance.  The reason for this is that an Array
is a [reference object vs. a value object](https://codeburst.io/explaining-value-vs-reference-in-javascript-647a975e12a0) 
and therefore the new variable in our example, `array_two` is pointing to a place in memory rather than holding the
value in memory. We end up with both `array_one` and `array_two` pointing to the same address in memory which contains
our array.

A shallow reference or object copy is demonstrated in the next snippet and is how you copy a simple object in ruby.
{% highlight ruby %}
array_one = [1,2]
array_two = array_one.dup
array_one << 3
array_one.inspect   # [1,2,3]
array_two.inspect   # [1,2]
{% endhighlight %}
And you will see here that making a shallow copy of `array_one` into the `array_two` variable does in this case make
a new copy of the object so that we can alter `array_one` by adding another value to it and then show that the copied
`array_two` is not altered because it is its own object.

### Deep Copy in Ruby?
Well then what is the problem you might say. The problem comes when you have more than one dimension to your object
thus meaning it is no longer a simple object. This applies to hash maps, arrays and any collection capable of being
nested into a multi-dimensional collection. In our `Image` class example we have a 2D array, where we nest the columnar
pixel values into rows in second dimension of the `@values` array. Let us see what happens when we try a simple copy...
{% highlight ruby %}
array_one = [ [1,2], [3,4] ]
array_two = array_one.dup
array_one[0] << 3
array_two.inspect   #  [[1,2,3], [3,4]]
{% endhighlight %}
Now it is important to see that altering `array_one` still altered the *duplicated* `array_two` which is **NOT** the 
behavior we want.  Because we used the `dup` method as in the previous example we expected our copy to remain 
just that, its own copy. But because a shallow copy only duplicates the first layer of complexity we get a reference
copy from there down and that is, as we said, just a pointer to the same instance in memory.

To get our deep copy Ruby expects us to override the `clone` method which by its default or base behavior will make
the same shallow copy as `dup` but the difference with`clone` is that it can be overridden in our `Image` class to 
perform the deep copy we need. Well actually we should *extend* it by making our own version of the `initialize_copy`
method, which is called by both `dup` and `clone`.

So to be clear, the goal is to get a separate copy of our object/array/hash so that we can alter it w/o altering the 
original. To do this the best practice is to provide our own deep copy implementation for use by our class. This
implementation can be done in a bunch of ways depending upon our object structure, but one way to do it that is 
somewhat univeral is to use `Marshal.dump` and `Marshal.load` which are methods that simply dump and reload the 
object directly from the memory heap.

### Deep Copy Implemented
One possible solution for our student's example might be this:

{% highlight ruby %}
class Image
    def initialize(array)
      @values = array
    end

    def initialize_copy(orig)
        cp = Marshal.load(Marshal.dump(orig))
        return cp
    end

    def output_image
        @new_string = ''
        @values.each do |x|
        x.each do |cell|
          @new_string += cell.to_s
        end
        puts @new_string
        @new_string = ''
     end
     puts ""
end
{% endhighlight %}
Now our `Image` class is equipped with a deep copy that will work for whatever it is call upon. And furthermore
because both the `dup` and `clone` methods call `initialize_copy` internally, they will both now perform the same
deep copy.

#### References Used
>[How to Make Deep Copies in Ruby](https://www.thoughtco.com/making-deep-copies-in-ruby-2907749) -- 
[Michael Morin](https://www.thoughtco.com/michael-morin-bio-2907692)
>[Making Deep Copies in Ruby](https://www.thoughtco.com/michael-morin-bio-2907692) -- 
[r/ruby: bannister](https://www.reddit.com/user/banister)


