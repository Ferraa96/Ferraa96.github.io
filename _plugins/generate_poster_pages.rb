module Jekyll
  class PosterPageGenerator < Generator
    safe true
    priority :high

    def generate(site)
      posters_data = site.data['posters']['posters'] || []

      posters_data.each do |poster|
        slug = poster['slug']
        title = poster['title']
        year = poster['year']
        conference = poster['conference']
        date = poster['date']
        location = poster['location']
        authors = poster['authors'] || []

        # Build page content
        content = <<~CONTENT
---
layout: page
title: #{title}
permalink: /posters/#{slug}/
---

<div class="row mt-5">
  <div class="col-lg-8">
    <div class="poster-header">
      <h2>#{title}</h2>
      <p><strong>#{conference}</strong><br>#{date} | #{location}</p>
    </div>

    <div class="poster-preview mt-4 mb-4">
      <img src="{{ '/assets/posters/#{slug}/thumbnail.jpg' | relative_url }}" alt="#{title} thumbnail" class="img-fluid" style="max-height: 400px; object-fit: contain;">
    </div>

    <div class="poster-actions mt-4">
      <a href="{{ '/assets/posters/#{slug}/poster.pdf' | relative_url }}" class="btn btn-primary me-2" target="_blank">
        <i class="fa-solid fa-file-pdf"></i> View Poster
      </a>
      <a href="{{ '/assets/posters/#{slug}/abstract.pdf' | relative_url }}" class="btn btn-outline-primary" target="_blank">
        <i class="fa-solid fa-file-lines"></i> View Abstract
      </a>
    </div>
  </div>

  <div class="col-lg-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Presentation Details</h5>
        <ul class="list-unstyled">
          <li><strong>Conference:</strong> #{conference}</li>
          <li><strong>Date:</strong> #{date}</li>
          <li><strong>Location:</strong> #{location}</li>
        </ul>
      </div>
    </div>

    <div class="card border-0 shadow-sm mt-3">
      <div class="card-body">
        <h5 class="card-title">Authors</h5>
        <ul class="list-unstyled">
          #{authors.map { |author| "<li>#{author}</li>" }.join("\n          ")}
        </ul>
      </div>
    </div>

    <a href="{{ '/posters/' | relative_url }}" class="btn btn-outline-secondary mt-4 w-100">
      <i class="fa-solid fa-arrow-left"></i> Back to Posters
    </a>
  </div>
</div>
CONTENT

        # Create page object
        page = PageWithoutAFile.new(site, site.source, '', slug)
        page.content = content
        page.data['layout'] = 'page'
        page.data['title'] = title
        page.data['permalink'] = "/posters/#{slug}/"

        site.pages << page
      end
    end
  end

  class PageWithoutAFile < Page
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @name = name
      @path = File.join(base, dir, name)

      process(@name)
      read_yaml(File.join(base, dir), name)
    end

    def read_yaml(base, name)
      @data = {}
    end
  end
end
