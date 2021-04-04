# Boris Bikes Challenge

![language-ruby](https://img.shields.io/badge/language-ruby-red)
![version-2.6.5](https://img.shields.io/badge/version-2.6.5-lightgrey)
![coverage-score](https://img.shields.io/badge/coverage-100%25-success)

## Motivation
The Boris Bikes programme will emulate emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## User Stories
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike √

As a person,
So that I can use a good bike,
I'd like to see if a bike is working √

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station √

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked √

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available. √

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity √

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes √

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary √

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it √

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes √

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not) √

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```

## Planning & Modelling

| Object   | Bike | Data Type | Dependency |
| -------- | ------- | ------ | ---------- |
| Methods  | #working? | boolean |

| Object   | DockingStation | Data Type | Dependency |
| -------- | -------------- | ------ | ---------- |
| Attributes | @docking_bay | array |
|            | @default_capacity | Int |
| Methods  | #release_bike |   | Bike |
|          | #dock_bike    |   | Bike |
|          | #see_bikes    |   |      | 
|          | #has_bikes?   |   |      |
|          | #at_capacity? |   |      |
|          | #modify_capacity |   |   |
|          | #report_broken_bike |   | Bike |

| Object   | Garage | Data Type | Dependency |
| -------- | ------- | ------ | ---------- |
| Attributes  | @garage | array | |
| Methods     | #fix_bike |   |   |

| Object   | Van | Data Type | Dependency |
| -------- | ------- | ------ | ---------- |
| Methods  | #collect_broken_bikes | DockingStation |
|          | #deliver_broken_bikes | Garage |
|          | #collect_working_bikes | Garage |
|          | #deliver_working_bikes | DockingStation |

## How to run
```
$ git clone git@github.com:sandyMax974/boris_bike_challenge.git
$ cd boris_bike_challenge
$ bundle install
$ pry
[1] pry(main)> require './lib/dockingStation.rb'
```

## Programming concepts applied

* Domain Modelling
* Encapsulation and cohesion
* Single Responsability Principle
* Private methods
* Method argument
* TTD cycle (RGR)
* Isolated unit test using stubs and mocks