﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShop_10
{
    [Serializable]
    public class UserLogin
    {
        public long UserID { get; set; }
        public string UserName { set; get; }

    }
}