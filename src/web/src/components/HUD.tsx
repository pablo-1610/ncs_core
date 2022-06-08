import { useState, useEffect } from "react"
import receiveNuiEvent from "../providers/receiveNuiEvent"
import timeImage from "../assets/images/hour.png"
import hungerImage from "../assets/images/hunger.png"
import thirstImage from "../assets/images/thirst.png"
import moneyImage from "../assets/images/money.png"

function HUD() {
   const [hours, setHours] = useState(new Date())
   const [date, setDates] = useState(new Date())
   const [hunger, setHunger] = useState(0)
   const [thirst, setThirst] = useState(0)
   const [money, setMoney] = useState("")

   const formatMoney = (money: number): string => {
      return money.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
   }

   useEffect(() => {
      const hoursInterval = setInterval(() => setHours(new Date()), 10000)
      const dateInterval = setInterval(() => setDates(new Date()), 1000 * 60 * 60 * 20)

      return () => {
         clearInterval(hoursInterval)
         clearInterval(dateInterval)
      }
   }, [])

   receiveNuiEvent("hud", "UPDATE_DATA", (data: {
      hunger: number,
      thirst: number,
      cash: number
   }) => {
      setHunger(data.hunger)
      setThirst(data.thirst)
      setMoney(formatMoney(data.cash))
   })
 
   return (
      <>
         <div className="container">
            <div className="container-top">
               <div className="thirst">
                  <img src={thirstImage} alt="thirst image"/>

                  <div className="thirstvalue">{thirst}</div>
               </div>
      
               <div className="hunger">
                  <img src={hungerImage} alt="hunger image"/>

                  <div className="hungervalue">{hunger}</div>
               </div>
      
               <div className="time">
                  <img src={timeImage} alt="time image"/>
                  
                  <div>
                     <div className="hourValue">
                        { hours.getHours() }:
                        { (hours.getMinutes() < 10 ? "0" : "") + hours.getMinutes() }
                     </div>

                     <div className="dateValue">
                        { date.getFullYear() +
                           "-" +
                           (date.getMonth() + 1 < 10 ? "0" : "") +
                           (date.getMonth() + 1) +
                           "-" +
                           date.getDate() }
                     </div>
                  </div>
               </div>
            </div>
         </div>
   
         <div className="container-bottom">
            <div className="moneyvalue">{money}</div>

            <img src={moneyImage} alt="money image"/>
         </div>
      </>
   )
}

export default HUD
