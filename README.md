# Coral Gardeners

[Coral Gardeners](https://www.coralgardeners.org/) is an NGO based in Mo’orea, French Polynesia, with a mission to save coral reefs through coral gardening. Their work involves two primary activities related to that mission:

* They educate adults and children about coral reefs, why they are important and the threats that the reefs face.
* They use the process of coral gardening to restore reefs by planting healthy coral fragments back onto the reef, primarily on the reef near Mo'orea, which has been heavily impacted.

## The Problem

Tracking restoration activities is a manual process involving the use of an underwater writing board, which then has to be transferred to a log booking system. This process is lengthy and labor intensive, and requires staff to perform calculations to determine the current status of their coral tables. It is also relatively opaque, making historical information and trends very difficult to access and assess.

## About this Project

This is a project initiated for Ruby for Good 2019. The intent of this project is to create a digital logbook that can be used for tracking all activities around the coral tables.

We will be doing this by building a Ruby on Rails app with the ability to review and analyze the daily activities around their garden.  Some things to keep in mind as we build this:

* The data used in generating the certificates (photos, GPS coordinates where planted, and name) is captured manually by staff, usually while underwater. They would love to have a simple offline application that they could put on a tablet with a waterproof case to capture this data electronically, to be uploaded when they get back to an area with internet. User experience for this portion of the app will likely be important to think through due to the unusual use case.
* Log entries need to be simple to input, and should only reflect the changes made. This preserves the history of activity, useful for reviewing the performance of each table and zone. A reconcilliation process will be run in order to generate totals and other useful information for display on a dashboard.

## Contributing to this Project

We would love to have your help!

To get started, check out the [CONTRIBUTING](CONTRIBUTING.md) doc for technical and process instructions, and be sure to read our [Code of Conduct](code-of-conduct.md).  Read [DESIGN](DESIGN.md) for a description of the overall project architecture and patterns.

## License

This project is licensed under the MIT license. For more details, see the [LICENSE](LICENSE.md) file.

# vim: tw=0
