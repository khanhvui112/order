package com.vuisk.blogs.service.impl;


import com.google.common.base.Strings;
import com.google.gson.JsonObject;
import com.vuisk.blogs.model.entities.Orders;
import com.vuisk.blogs.repository.OrdersRepository;
import com.vuisk.blogs.service.OrderService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.List;
import java.util.regex.Pattern;

@Service
public class OrdersServiceImpl implements OrderService {
    @Autowired
    private OrdersRepository ordersRepository;

    @Override
    public List<Orders> findAll() {
        return ordersRepository.findAll();
    }

    @Override
    public Orders findById(Long id) {
        return ordersRepository.findById(id).orElse(null);
    }

    @Override
    public Orders insert(Orders order) {
        order.setNote(order.getNote().trim());
//        order.setPayment(false);
        String p = covertToString(order.getName().trim()) + " "+ order.getDepartment();
        order.setDescription(p.trim());
        try {
            String qr = createQR(order.getDescription());
            if(!Strings.isNullOrEmpty(qr)){
                order.setQrPayment(qr);
            }
        }catch (Exception ignored){

        }
        return ordersRepository.save(order);
    }
    public String covertToString(String value) {
        try {
            String temp = Normalizer.normalize(value, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
            return pattern.matcher(temp).replaceAll("");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return value;
    }
    @Override
    public Orders update(Orders order) {
//        order.setPayment(false);
        return ordersRepository.save(order);
    }

    @Override
    public void deleteById(Long id) {
        ordersRepository.deleteById(id);
    }

    public List<Orders> findByCreate(long start, long end) {
        return ordersRepository.findByCreateTime(start, end);
    }

    private static String createQR(String addInfo) throws IOException, JSONException {
        URL obj = new URL("https://api.vietqr.io/v2/generate");
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("x-client-id", "9de3501d-e58a-45e6-a2ea-adb40adbca31");
        con.setRequestProperty("x-api-key", "04a0dbb3-9e39-4a66-bdf8-8d08e982a9f6");
        String jsonString = "{\n" +
                "    \"accountNo\": \"19038697466019\",\n" +
                "    \"accountName\": \"SAN KHANH VUI\",\n" +
                "    \"acqId\": \"970407\",\n" +
                "    \"addInfo\": \""+addInfo+"\",\n" +
                "    \"template\": \"compact\"\n" +
                "}";
        con.setDoOutput(true);
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }
        OutputStream os = con.getOutputStream();
        os.write("userName=Pankaj".getBytes());
        os.flush();
        os.close();
        // For POST only - END

        int responseCode = con.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) { //success
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            JSONObject jsonObject = new JSONObject(response.toString());
            JSONObject dataJson = jsonObject.getJSONObject("data");
            return dataJson.getString("qrDataURL");
        } else {
        }
        return null;
    }
}
