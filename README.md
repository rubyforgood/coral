# Coral Gardeners

[Coral Gardeners](https://www.coralgardeners.org/) is an NGO based in Mo’orea, French Polynesia, with a mission to save coral reefs through coral gardening. Their work involves two primary activities related to that mission:

* They educate adults and children about coral reefs, why they are important and the threats that the reefs face.
* They use the process of coral gardening to restore reefs by planting healthy coral fragments back onto the reef, primarily on the reef near Mo'orea, which has been heavily impacted.

## The Problem

Coral adoptions are a key source of donations for the organization. Each coral adoption is unique and comes with a certificate that provides a picture of the coral, its name and its GPS coordinates.

Currently, they produce these certificates in Photoshop with staff spending a significant amount of time on them. The time spent on these, while important, takes away from time they could be spending on work directly related to their mission.

## About this Project

This is a project initiated for Ruby for Good 2019. The intent of this project is to automate the process of creating the certificates with the unique information for each coral.

We will be doing this by building a Ruby on Rails app with the ability to automate the creation of these certificates. Some things to keep in mind as we build this:

* The data used in generating the certificates (photos, GPS coordinates where planted, and name) is captured manually by staff, usually while underwater. They would love to have a simple offline application that they could put on a tablet with a waterproof case to capture this data electronically, to be uploaded when they get back to an area with internet. User experience for this portion of the app will likely be important to think through due to the unusual use case.
* Certificates need to be generated and sent to adopters electronically. An [example adoption certificate](https://static.wixstatic.com/media/a7fd24_a79c9ef769664215a515823339501491~mv2.jpg/v1/crop/x_0,y_12,w_1525,h_1057/fill/w_1380,h_950,al_c,q_85,usm_0.66_1.00_0.01/coral-gardeners-certificat.webp) is on [the Coral Gardeners' website's "Adopt Corals" page](https://www.coralgardeners.org/adopt-corals) near the bottom. The initial idea here is to generate these in PDF format.

## Contributing to this Project

We would love to have your help!

To get started, check out the [CONTRIBUTING](CONTRIBUTING.md) doc for technical and process instructions, and be sure to read our [Code of Conduct](code-of-conduct.md).

## License

This project is licensed under the MIT license. For more details, see the [LICENSE](LICENSE.md) file.
