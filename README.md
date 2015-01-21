#Form Validations, Flash and Bootstrap
---

Today we'll learn how errors work in Rails, how to pass errors the our users with flash, and how to make them look great with bootstrap.

First, let look at a finished app.

##Validations and Errors
---

**Pairing Exercise** 

With your pair, spend a few minutes adding validations to your Ingredient model. Add at least 5 validations. You can look at your options here: [Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html).

Now, lets hop into the `rails console` and play with some ingredient objects.

Let's make some objects that pass our validations and some that don't. 

You can use `#errors` to see if any of your objects have errors. But there is a gotcha: Rails doesn't check if an object is valid until we call `#valid?`, `#create` or `#save` on it.

You need to always keep that in mind when building controllers in your apps.

##Flash Messages
---

Flash messages let us pass temporary messages to the user. Firstly, we need to display flash by adding it to our layout file. Here is a simple implementation:

`<%= flash %>`

Now let's add a flash message to the hash. Let's try together now.

##The FlashHash

The flash hash is a hash. So we will always be saving flash messages as key-value pairs, then accessing them using the same key.

**Pairing Exercise**

Add a flash message to your sessions controller that will display a message on successful login. The syntax looks like this: `flash[:info] = "MESSAGE"`. How do we adjust our application controller to show this message? The `flash` above isn't enough.

Then, add a message for failed login, using `:alert` instead of `:info`. Setup both your controller and layout.


##Flashes and Forms

Let's go back to the console, and see how we can format error messages.

We have three options:

1. `message`
2. `full_messages`
3. `full_messages.to_sentences`

**Pairing Exercise**

Take a moment and use each method above. What does each method return? And which one do you like the most?

##Code-Along

Let's add an Invalid Form error to our form when someone submits bad info.

Once that is done, let's test it.

Now, let's refactor it! Let's show all the messages, from the model, when there is an error.

##Multiple Flashes

What should we do if we have an `info` flash and `errors` flash at the same time? How can we make our flash in the layout work better?

This snippet below uses iteration and handle multiple:


```rb
<% flash.each do |key, value| %>
  <%= key %>: <%= value %>
<% end %>
```

##Bootstrap

Let's look at our styling options: [Bootstrap Alerts](http://getbootstrap.com/components/#alerts)

How can we setup our flashes to apply the styles bootstrap wants to use?

```rb
<% flash.each do |key, value| %>
  <div class='alert alert-<%= key %>' role='alert'>
    <%= value %>
  </div>
<% end %>
```

**Pairing Exercise**

Knowing the names of the bootstrap alert styles, what are four FlashHash keys we should limit ourselves too? Why?

Try to use each of them now. Then, try to use a key that isn't stlyed by bootstrap.

##Bootstrap Styles

If we stick to bootstrap's four alerts, our flashes will always look great

##More Info

Here is the Rails docs on the FlashHash: http://api.rubyonrails.org/classes/ActionDispatch/Flash/FlashHash.html#method-i-stringify_array