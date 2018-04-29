package com.bphvcg.awsproject;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class Quickstart {

	private static String S3_BUCKET_NAME = "gr5bucket";

	private static String AMAZON_ACCESS_KEY = "AKIAI34SIUWNK3QQWYJA";

	private static String AMAZON_SECRET_KEY = "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";

	public static String UploadFile(MultipartFile file) {

		String link = "";

		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(AMAZON_ACCESS_KEY, AMAZON_SECRET_KEY);
		AmazonS3 s3client = new AmazonS3Client(awsCredentials);

		try {

			InputStream input = file.getInputStream();
			String name = file.getOriginalFilename().split("\\.")[0] + "_"
					+ UUID.randomUUID().toString().replaceAll("-", "");
			String ext = FilenameUtils.getExtension(file.getOriginalFilename());
			String nameExt = name + "." + ext;
			s3client.putObject(new PutObjectRequest(S3_BUCKET_NAME, nameExt, input, new ObjectMetadata())
					.withCannedAcl(CannedAccessControlList.PublicRead));

			link = s3client
					.getObject(new GetObjectRequest(S3_BUCKET_NAME, nameExt))
					.getObjectContent()
					.getHttpRequest()
					.getURI()
					.toString();

			System.out.println(link); // check upload successfully

		} catch (IOException e) {
			e.printStackTrace();
			link = "Upload failed";
		}

		return link;

	}
}
