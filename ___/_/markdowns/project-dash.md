# DASH Documentation

This is a main documentation for DASH project.

## General notes on writing and organizing documentation

The documentation will slightly differ for a client (front-end) and server (back-end). However these two parts of application have to communicate in some way so they will be some intersection.

The client is dependent on server it means that server will refer to client documentation but opposite is strictly prohibited.

### Client

#### Page

Client is defined in terms of pages (sections) e.g `profile`. The page define some context e.g on `profile` page is everything related to the current user where user can edit or even delete its account. The page has its lifecycle -- it is statefull entity.

##### States

on_page_enter
on_page_leave

Each page documentation contains these informations:

1. The base URL route e.g `/account`
2. What data to load when page is entered.
3. What data to save when page is exited.
4. Whenever the authentication is required.

Add 1. This is simply the URL which points to the page e.g `www.service.net/account`

### Server

Server is defined in terms of routes e.g `/account`.
Each route is associated at least with one endpoint e.g `GET`, `POST` etc.

## Overview

DASH is an application to create, manage, share and publish the analyses and reports. The application has client-server architecture, where client (frontend) is web single page application (SPA) and server (backend) provides the REST API.

## Server

| Owner       | Repository                              | Technology |
| ----------- | --------------------------------------- | ---------- |
| David Landa | https://github.com/czech-radio/dash.api | Python     |

## REST API

## Client

| Owener       | Repository                              | Technology |
| ------------ | --------------------------------------- | ---------- |
| Adama Mertel | https://github.com/czech-radio/dash.gui | TypeScript |

## Pages

### Analysis

Analysis page allow to create and manage the

### Profile
