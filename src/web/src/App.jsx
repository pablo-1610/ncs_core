import "animate.css";
import React, { useState, useEffect } from "react";
import Nui from "./utils/Nui";
import "./App.scss";

import hourIMG from "./assets/img/hour.png";
import hungerIMG from "./assets/img/hunger.png";
import thirstIMG from "./assets/img/thirst.png";
import moneyIMG from "./assets/img/money.png";

function App() {
  const [hidden, setHidden] = useState(false);
  const [hours, setHours] = useState(new Date());
  const [date, setDates] = useState(new Date());
  const [hunger, setHunger] = useState(0);
  const [thirst, setThirst] = useState(0);
  const [money, setMoney] = useState(0);

  const updateHours = () => setHours(new Date());
  const updateDate = () => setDates(new Date());

  var hoursInterval, dateInterval;

  useEffect(() => {
    hoursInterval = setInterval(updateHours, 10000);
    dateInterval = setInterval(updateDate, 1000 * 60 * 60 * 20);
    return () => {
      if (hoursInterval) clearInterval(hoursInterval);
      if (dateInterval) clearInterval(dateInterval);
    };
  }, []);

  const closePage = () => {
    setHidden(true);
    Nui.send("hud", {});
  };

  window.addEventListener("message", function (event) {
    const eventData = event.data;

    if (eventData.hidden === false) {
      setHidden(false);
    } else if (eventData.hidden === true) {
      closePage();
    } else if (eventData.type === "UPDATE_HUNGER_THIRST_CASH") {
      setHunger(Math.round(eventData.values.hunger));
      setThirst(Math.round(eventData.values.thirst));
      setMoney(formatNumber(eventData.values.cash));
    }
  });

  function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
  }

  return (
    <div id="app" hidden={hidden}>
      <div className="container">
        <div className="container-top">
          <div className="thirst">
            <img src={thirstIMG} alt="" />
            <div className="thirstvalue">{thirst}</div>
          </div>

          <div className="hunger">
            <img src={hungerIMG} alt="" />
            <div className="hungervalue">{hunger}</div>
          </div>

          <div className="time">
            <img src={hourIMG} alt="" />
            <div className="_">
              <div className="hourValue">
                {hours.getHours()}:
                {(hours.getMinutes() < 10 ? "0" : "") + hours.getMinutes()}
              </div>
              <div className="dateValue">
                {date.getFullYear() +
                  "-" +
                  (date.getMonth() + 1 < 10 ? "0" : "") +
                  (date.getMonth() + 1) +
                  "-" +
                  date.getDate()}
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="container-bottom">
        <div className="moneyvalue">{money}</div>
        <img src={moneyIMG} alt="" />
      </div>
    </div>
  );
}

export default App;
