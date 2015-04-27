﻿using sync.today.io.activities;
using System;
using System.Activities;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sync.today.io.caldav.activities
{
    public sealed class SaveCalDAVAppointment : SaveIOAppointment
    {
        public InArgument<Models.CalDAVEventDTO> Appointment { get; set; }
        protected override void DoExecute(CodeActivityContext context)
        {
            devlog.Debug(string.Format("Called on '{0}'", Appointment));
            var myAppointment = Appointment.Get(context);
            devlog.Debug(string.Format("myExchangeAppointment:'{0}'", myAppointment));
            Repository.save(myAppointment, myAppointment.ServiceAccountId);
        }

    }
}
