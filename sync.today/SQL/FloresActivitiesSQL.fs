﻿module FloresActivitiesSQL

open Common
open System
open System.Data
open System.Data.Linq
open System.Data.SqlClient
open Microsoft.FSharp.Data.TypeProviders
open sync.today.Models
open MainDataConnection

let private FloresActivityByInternalId( internalId : Guid ) = 
    query {
        for r in db().FloresActivities do
        where ( r.InternalId = internalId )
        select r
    } |> Seq.tryHead

let private FloresActivityByExternalId( externalId : string ) = 
    query {
        for r in db().FloresActivities do
        where ( r.ExternalId = externalId )
        select r
    } |> Seq.tryHead

let private copyToFloresActivity(destination : SqlConnection.ServiceTypes.FloresActivities, source : FloresActivityDTO ) =
    if destination.Id = 0  then
        destination.Id <- source.Id
    destination.ActivityType_ID <- source.ActivityType_ID
    destination.CorrectedDATE <- source.CorrectedDATE
    destination.Description <- source.Description
    destination.ExternalId <- source.ExternalId
    destination.InternalId <- source.InternalId
    destination.RealEndDate <- source.RealEndDate
    destination.RealStartDate <- source.RealStartDate
    destination.ResponsibleUser_ID <- source.ResponsibleUser_ID
    destination.SheduledEndDate <- source.SheduledEndDate
    destination.SheduledStartDate <- source.SheduledStartDate
    destination.Subject <- source.Subject
    destination.Tag <- Nullable<int>(source.Tag)
    destination.Period_ID <- source.Period_ID
    destination.Status_ID <- source.Status_ID
    destination.Division_ID <- source.Division_ID
    destination.Firm_ID <- source.Firm_ID
    destination.Person_ID <- source.Person_ID
    destination.OutlookCategory_ID <- source.OutlookCategory_ID



let saveFloresActivity( app : FloresActivityDTO, upload : bool ) = 
    let db = db()
    let possibleApp = if upload then FloresActivityByInternalId( app.InternalId ) else FloresActivityByExternalId( app.ExternalId )
    if ( box possibleApp = null ) then
        let newApp = new SqlConnection.ServiceTypes.FloresActivities()
        copyToFloresActivity(newApp, app)
        newApp.Upload <- upload
        db.FloresActivities.InsertOnSubmit newApp
    else
        copyToFloresActivity(possibleApp.Value, app)
        possibleApp.Value.Upload <- upload
    db.DataContext.SubmitChanges()

let private FloresActivitiesToUpload1() = 
    let db = db()
    query {
        for r in db.FloresActivities do
        where ( r.Upload )
(*        select { Id = r.Id; InternalId = r.InternalId; ExternalId = r.ExternalId; CorrectedDATE = r.CorrectedDATE; ActivityType_ID = r.ActivityType_ID; Description = r.Description;
                    Subject = r.Subject; SheduledStartDate = r.SheduledStartDate; SheduledEndDate = r.SheduledEndDate; RealStartDate = r.RealStartDate; RealEndDate = r.RealEndDate;
                    ResponsibleUser_ID = r.ResponsibleUser_ID; 
                    Period_ID = r.Period_ID; Status_ID = r.Status_ID; Division_ID = r.Division_ID; Firm_ID = r.Firm_ID; Person_ID = r.Person_ID; OutlookCategory_ID = r.OutlookCategory_ID;
                    Tag = ( if r.Tag.HasValue then r.Tag.Value else 0 ) }*)
        select r
    } |> Seq.toList 

let FloresActivitiesToUpload() : FloresActivityDTO list = 
    let activities = FloresActivitiesToUpload1()
    activities |> Seq.map ( fun r -> { Id = r.Id; InternalId = r.InternalId; ExternalId = r.ExternalId; CorrectedDATE = r.CorrectedDATE; ActivityType_ID = r.ActivityType_ID; Description = r.Description;
                    Subject = r.Subject; SheduledStartDate = r.SheduledStartDate; SheduledEndDate = r.SheduledEndDate; RealStartDate = r.RealStartDate; RealEndDate = r.RealEndDate;
                    ResponsibleUser_ID = r.ResponsibleUser_ID; 
                    Period_ID = r.Period_ID; Status_ID = r.Status_ID; Division_ID = r.Division_ID; Firm_ID = r.Firm_ID; Person_ID = r.Person_ID; OutlookCategory_ID = r.OutlookCategory_ID;
                    Tag = ( if r.Tag.HasValue then r.Tag.Value else 0 ) } ) |> Seq.toList
(* 
    for r in activities do
        printfn "%A" r
        printfn "%A" { Id = r.Id; InternalId = r.InternalId; ExternalId = r.ExternalId; CorrectedDATE = r.CorrectedDATE; ActivityType_ID = r.ActivityType_ID; Description = r.Description;
                    Subject = r.Subject; SheduledStartDate = r.SheduledStartDate; SheduledEndDate = r.SheduledEndDate; RealStartDate = r.RealStartDate; RealEndDate = r.RealEndDate;
                    ResponsibleUser_ID = r.ResponsibleUser_ID; 
                    Period_ID = r.Period_ID; Status_ID = r.Status_ID; Division_ID = r.Division_ID; Firm_ID = r.Firm_ID; Person_ID = r.Person_ID; OutlookCategory_ID = r.OutlookCategory_ID;
                    Tag = ( if r.Tag.HasValue then r.Tag.Value else 0 ) }
    [| |] |> Seq.toList
*)

let changeFloresActivityExternalId(app : FloresActivityDTO, externalId : string) =
    let cnn = cnn()
    cnn.ExecuteCommand("UPDATE FloresActivities SET ExternalId = {0} WHERE InternalId = {1}", externalId, app.InternalId ) |> ignore

let setFloresActivityAsUploaded(app : FloresActivityDTO) =
    let cnn = cnn()
    cnn.ExecuteCommand("UPDATE FloresActivities SET Upload = 0 WHERE InternalId = {0}", app.InternalId ) |> ignore
