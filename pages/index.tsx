import Head from 'next/head';
import { addresses } from '../data/addresses';
import { gql, useQuery } from '@apollo/client';
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';

const allUsersQuery = gql`
    query {
      users {
        id
        firstName
        lastName
        email
        addresses {
          city
          state
          country
        }
      }
    }
`;

export default function Home() {

  const { data, error, loading } = useQuery(allUsersQuery);

  if (loading) return <p>Loading....</p>;

  if (error) return <p>Error Loading  {error.message}</p>;

  return (
    <div>
      <h1>User List</h1>
      <div>
      <table>
      {data.users.length > 0 ? (
        <>
        <thead>
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Address</th>
          </tr>
        </thead>
        <tbody>
          {data?.users.map(user => (
            <tr key={user.id}>
              <td>{user.id}</td>
              <td>{user.firstName}</td>
              <td>{user.lastName}</td>
              <td>{user.email}</td>
              <Popup trigger={<button style={{ 'color': 'blue' }}> Address </button>}
                position="right center">
                <table>
                  {user.addresses.length > 0 ? (
                    <>
                      <thead>
                        <tr>
                          <th>City</th>
                          <th>State</th>
                          <th>Country</th>
                        </tr>
                      </thead>
                      <tbody>
                        {user.addresses.map((address) => (
                          <tr key={address.id}>
                            <td>{address.city}</td>
                            <td>{address.state}</td>
                            <td>{address.country}</td>
                          </tr>
                        ))}
                      </tbody>
                    </>
                  ) : (
                    <tbody>
                      <tr>
                        <td colSpan="3">No address data available</td>
                      </tr>
                    </tbody>
                  )}
                </table>
              </Popup>
            </tr>
          ))}
        </tbody>
        </>
        ) : (
          <tbody>
            <tr>
              <td colSpan="3"><p style={{'color':'red'}}>No Users available</p></td>
            </tr>
          </tbody>
        )}
      </table>
      </div>
    </div>
  );
}
