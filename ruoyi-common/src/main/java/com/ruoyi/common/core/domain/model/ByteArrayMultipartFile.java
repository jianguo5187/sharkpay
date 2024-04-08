package com.ruoyi.common.core.domain.model;

import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ByteArrayMultipartFile  implements MultipartFile {
    private byte[] content;
    private String fileName;
    private String contentType;
    private String originalFileName;

    public ByteArrayMultipartFile(byte[] content, String fileName, String contentType, String originalFileName) {
        this.content = content;
        this.fileName = fileName;
        this.contentType = contentType;
        this.originalFileName = originalFileName;
    }

    @Override
    public String getName() {
        return this.originalFileName;
    }

    @Override
    public String getOriginalFilename() {
        return this.originalFileName;
    }

    @Override
    public String getContentType() {
        return this.contentType;
    }

    @Override
    public boolean isEmpty() {
        return this.content == null || this.content.length == 0;
    }

    @Override
    public long getSize() {
        return this.content != null ? this.content.length : 0;
    }

    @Override
    public byte[] getBytes() throws IOException {
        return this.content != null ? this.content : new byte[0];
    }

    @Override
    public InputStream getInputStream() throws IOException {
        return new ByteArrayInputStream(this.content);
    }

    @Override
    public void transferTo(File dest) throws IOException, IllegalStateException {
        Files.write(Paths.get(dest.toURI()), this.content);
    }
}
