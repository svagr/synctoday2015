﻿using System;
using System.Activities;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sync.today.activities.Appointments
{
    public sealed class GetAppointmentsModifiedThroughAdapter : CodeActivity
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger
    (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public InArgument<Models.ConsumerDTO> Consumer { get; set; }
        public OutArgument<Models.AppointmentDTO[]> Result { get; set; }
        protected override void Execute(CodeActivityContext context)
        {
            log.Debug(string.Format("Entered for '{0}' and '{1}'", Consumer, Result));
            try
            {
                var myConsumer = Consumer.Get(context);
                log.Debug(string.Format("Got '{0}'", myConsumer));
                var modifiedItems = AppointmentRepository.ModifiedThroughAdapter(myConsumer);
                List<Models.AppointmentDTO> resultItems = new List<Models.AppointmentDTO>(modifiedItems);
                Result.Set(context, resultItems.ToArray());
            }
            catch (Exception ex)
            {
                log.Fatal("failed", ex);
                throw;
            }
        }

    }
}
