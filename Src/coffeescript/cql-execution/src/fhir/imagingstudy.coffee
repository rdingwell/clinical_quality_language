# Copyright (c) 2014 The MITRE Corporation
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice, this 
#       list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, 
#       this list of conditions and the following disclaimer in the documentation 
#       and/or other materials provided with the distribution.
#     * Neither the name of HL7 nor the names of its contributors may be used to 
#       endorse or promote products derived from this software without specific 
#       prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
# POSSIBILITY OF SUCH DAMAGE.
###*
@namespacing scoping into the FHIR namespace
###
require './core'

###* 
 Embedded class
@class ImagingStudySeriesInstanceComponent
@exports  ImagingStudySeriesInstanceComponent as ImagingStudySeriesInstanceComponent
###
class ImagingStudySeriesInstanceComponent
  constructor: (@json) ->
    super(@json)
  ###*
  The number of this image in the series.
  @returns {Array} an array of {@link Number} objects
  ###
  number:-> @json['number']
  
  ###*
  Formal identifier for this image.
  @returns {oid}
  ###
  uid: -> if @json['uid'] then new oid(@json['uid'])
  
  ###*
  DICOM Image type.
  @returns {oid}
  ###
  sopclass: -> if @json['sopclass'] then new oid(@json['sopclass'])
  
  ###*
  Type of instance (image etc) (0004,1430).
  @returns {Array} an array of {@link String} objects
  ###
  fhirType:-> @json['fhirType']
  
  ###*
  Description (0070,0080 | 0040,A043 > 0008,0104 | 0042,0010 | 0008,0008).
  @returns {Array} an array of {@link String} objects
  ###
  title:-> @json['title']
  
  ###*
  WADO-RS url where image is available.
  @returns {Array} an array of {@link String} objects
  ###
  url:-> @json['url']
  
  ###*
  A FHIR resource with content for this instance.
  @returns {Reference}
  ###
  attachment: -> if @json['attachment'] then new Reference(@json['attachment'])
  

###* 
 Embedded class
@class ImagingStudySeriesComponent
@exports  ImagingStudySeriesComponent as ImagingStudySeriesComponent
###
class ImagingStudySeriesComponent
  constructor: (@json) ->
    super(@json)
  ###*
  The number of this series in the overall sequence.
  @returns {Array} an array of {@link Number} objects
  ###
  number:-> @json['number']
  
  ###*
  The modality of this series sequence.
  @returns {Array} an array of {@link String} objects
  ###
  modality:-> @json['modality']
  
  ###*
  Formal identifier for this series.
  @returns {oid}
  ###
  uid: -> if @json['uid'] then new oid(@json['uid'])
  
  ###*
  A description of the series.
  @returns {Array} an array of {@link String} objects
  ###
  description:-> @json['description']
  
  ###*
  Sequence that contains attributes from the.
  @returns {Array} an array of {@link Number} objects
  ###
  numberOfInstances:-> @json['numberOfInstances']
  
  ###*
  Availability of series (online, offline or nearline).
  @returns {Array} an array of {@link String} objects
  ###
  availability:-> @json['availability']
  
  ###*
  WADO-RS URI where Series is available.
  @returns {Array} an array of {@link String} objects
  ###
  url:-> @json['url']
  
  ###*
  Body part examined. See  DICOM Part 16 Annex L for the mapping from DICOM to Snomed.
  @returns {Coding}
  ###
  bodySite: -> if @json['bodySite'] then new Coding(@json['bodySite'])
  
  ###*
  When the series started.
  @returns {Date}
  ###
  dateTime: -> if @json['dateTime'] then new Date(@json['dateTime'])
  
  ###*
  A single image taken from a patient.
  @returns {Array} an array of {@link ImagingStudySeriesInstanceComponent} objects
  ###
  instance: ->
    if @json['instance']
      for item in @json['instance']
        new ImagingStudySeriesInstanceComponent(item)
  
###*
Manifest of a set of images produced in study. The set of images may include every image in the study, or it may be an incomplete sample, such as a list of key images.
@class ImagingStudy
@exports ImagingStudy as ImagingStudy
###
class ImagingStudy 
  constructor: (@json) ->
  ###*
  Date and Time the study took place.
  @returns {Date}
  ###
  dateTime: -> if @json['dateTime'] then new Date(@json['dateTime'])
  
  ###*
  Who the images are of.
  @returns {Reference}
  ###
  subject: -> if @json['subject'] then new Reference(@json['subject'])
  
  ###*
  Formal identifier for the study.
  @returns {oid}
  ###
  uid: -> if @json['uid'] then new oid(@json['uid'])
  
  ###*
  Accession Number.
  @returns {Identifier}
  ###
  accessionNo: -> if @json['accessionNo'] then new Identifier(@json['accessionNo'])
  
  ###*
  Other identifiers for the study.
  @returns {Array} an array of {@link Identifier} objects
  ###
  identifier: ->
    if @json['identifier']
      for item in @json['identifier']
        new Identifier(item)
  
  ###*
  A list of the diagnostic orders that resulted in this imaging study being performed.
  @returns {Array} an array of {@link Reference} objects
  ###
  order: ->
    if @json['order']
      for item in @json['order']
        new Reference(item)
  
  ###*
  A list of all the Series.ImageModality values that are actual acquisition modalities, i.e. those in the DICOM Context Group 29 (value set OID 1.2.840.10008.6.1.19).
  @returns {Array} an array of {@link String} objects
  ###
  modality:-> @json['modality']
  
  ###*
  The requesting/referring physician.
  @returns {Reference}
  ###
  referrer: -> if @json['referrer'] then new Reference(@json['referrer'])
  
  ###*
  Availability of study (online, offline or nearline).
  @returns {Array} an array of {@link String} objects
  ###
  availability:-> @json['availability']
  
  ###*
  WADO-RS URI where Study is available.
  @returns {Array} an array of {@link String} objects
  ###
  url:-> @json['url']
  
  ###*
  Number of Series in Study.
  @returns {Array} an array of {@link Number} objects
  ###
  numberOfSeries:-> @json['numberOfSeries']
  
  ###*
  Number of SOP Instances in Study.
  @returns {Array} an array of {@link Number} objects
  ###
  numberOfInstances:-> @json['numberOfInstances']
  
  ###*
  Diagnoses etc provided with request.
  @returns {Array} an array of {@link String} objects
  ###
  clinicalInformation:-> @json['clinicalInformation']
  
  ###*
  Type of procedure performed.
  @returns {Array} an array of {@link Coding} objects
  ###
  procedure: ->
    if @json['procedure']
      for item in @json['procedure']
        new Coding(item)
  
  ###*
  Who read study and interpreted the images.
  @returns {Reference}
  ###
  interpreter: -> if @json['interpreter'] then new Reference(@json['interpreter'])
  
  ###*
  Institution-generated description or classification of the Study (component) performed.
  @returns {Array} an array of {@link String} objects
  ###
  description:-> @json['description']
  
  ###*
  Each study has one or more series of image instances.
  @returns {Array} an array of {@link ImagingStudySeriesComponent} objects
  ###
  series: ->
    if @json['series']
      for item in @json['series']
        new ImagingStudySeriesComponent(item)
  



module.exports.ImagingStudy = ImagingStudy
