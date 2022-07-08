export default function formatMoney(money: number): string {
   return money.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
}