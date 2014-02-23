Rails3 Before Render  [![Build Status](https://secure.travis-ci.org/shell/rails3_before_render.png)](https://secure.travis-ci.org/shell/rails3_before_render.png) [![Code Climate](https://codeclimate.com/github/shell/rails3_before_render.png)](https://codeclimate.com/github/shell/rails3_before_render)
===========================

**Supports Rails 3 & 4**

## Introduction
  Add a hook like before_filter to your controllers that gets executed between
when your action is completed and the template is rendered.  It can really
DRY up loading some data that is used for views (headers / layouts / etc).

  Plugin was inspired by before_render by Todd Willey, which works for rails2 only. New *ActiveSupport::Callbacks* methods were used, in analogy with ActionDispatch.

Provided methods:

- before_render
- prepend\_before\_render
- skip\_before\_render

## Installation

    gem 'rails3_before_render'

  Warning: Rails 3 & 4 only. Rails2 users can use [before_render](<https://github.com/xtoddx/before_render>) by Todd Willey.

## Usage
  before_render / prepend\_before\_render / skip\_before\_render works as other filters. Options like :except and :only can be passed to filter.

    class PostsController < ApplicationController
      before_render :ping, :except => [:destroy]

      def index; end

      def new; end

      def show; end

      def destroy; end

      private
        def ping
          Rails.logger.info "Ping-Pong actions"
        end
    end

  Method ping will be executed after your actions and before template is rendered.

## TODO

- Tests should not throw runtime error(happening right now if comment one of provided aliased methods)

## Author
Copyright (c) 2011 Vladimir Penkin, released under the MIT license

Thanks to Drake Wilson (@menostos) for initiative to convert this to ruby gem.

Rails 4 support by Dheeraj Kumar (@codepodu)