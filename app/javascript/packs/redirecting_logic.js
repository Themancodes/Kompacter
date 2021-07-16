

// const getUserIpAdress = () => {
//   const userIPinside = fetch('https://api.db-ip.com/v2/free/self')
//   .then(response => response.json())
//   .then( data => {
//     const {city, continentName, countryCode, ipAddress, stateProv} = data
//     console.log(city, data)
//   })  
// } 


// city: "Monterrey"
// continentCode: "NA"
// continentName: "North America"
// countryCode: "MX"
// countryName: "Mexico"
// ipAddress: "189.152.136.125"
// stateProv: "Nuevo León"

let temp1 = {}

async function getUserIpAdress() {
  const response = await fetch('https://api.db-ip.com/v2/free/self', {});
  const json = await response.json();
  console.log(json, "Inside")
  temp1 = {...json}
  
}

getUserIpAdress()



console.log(temp1, "temp1")


// const userAgent = navigator.userAgent
// console.log(userAgent, "userAgent")



// fetch("http://localhost:3000/users", {
//    method: 'POST',
//    headers: {
//       'Content-Type': 'application/json',
//    },
//    body: JSON.stringify({
//       first_name: userFirstName,
//       last_name: userLastName,
//       age: userAge
//    })
// })